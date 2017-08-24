#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include "sensor_msgs/LaserScan.h"
#include "laser_scanner_infoscreen/biometrics.h"
#include "laser_scanner_infoscreen/biometrics_results.h"
#include "laser_scanner_infoscreen/stepper_control.h"
#include "laser_scanner_infoscreen/gesture_call.h"
#include "laser_scanner_infoscreen/external_control.h"
#include "std_msgs/Int16.h"
#include <cstdlib>
#include <cmath>
#include <visualization_msgs/Marker.h>
#include <string>
#include <chrono>
#include <thread>

#define TIMEOUT_LIMIT  4
#define POI_THRESHOLD 0.4f
#define MAX_RANGE 7.0f
#define PRESENTATION_RANGE 3.0f
#define BIOMETRICS_FLAG false
#define HAS_SCREEN_CONTROL true
#define GESTURES_ENABLED true

static int poi_constructed = 0;
static int poi_destructed = 0;
static int biometrics_id_count = 0;
static int stepper_filter = 0;
static int area_last_active_id;
static int zoom_level;
static ros::Time last_external_sent;
static ros::Time biometrics_timestamp;

/* Type for Person Of Interest, i.e. object being tracked */
struct poi_t {
	std::pair<float,float> poi_pos;
	float timeout;
	float height;
	int biometrics_id;
	poi_t(std::pair<float,float> pos) :
		poi_pos(pos),
		timeout(0.0f),
		height(0.0f),
		biometrics_id(-1)
	{
		poi_constructed++;
	};
	~poi_t()
	{
		poi_destructed++;
	}
};

/* Type for presentation areas of sector shape. Includes a test whether POI is
inside the area */
struct area_t {
	float r_min, r_max, th_min, th_max;
	int id;
	std_msgs::ColorRGBA c;
	std::string name;
	bool is_active;
	area_t(float draw_r_min, float draw_r_max, float draw_th_min, float draw_th_max,
	       std_msgs::ColorRGBA area_c, std::string area_name, int area_id) :
		r_max(draw_r_max),
		r_min(draw_r_min),
		th_max(draw_th_max),
		th_min(draw_th_min),
		c(area_c),
		name(area_name),
		id(area_id),
		is_active(false)
	{
	};
	bool test_poi(poi_t &poi) {
		float angle = atan(poi.poi_pos.second / poi.poi_pos.first);
		float range = sqrt(pow(poi.poi_pos.second,2) + pow(poi.poi_pos.first,2));
		if (range > this->r_min && range < this->r_max
		    && angle > this->th_min && angle < this->th_max) {
			this->is_active = true;
			return true;
			ROS_DEBUG("Activated area %s", this->name.c_str());
		} else {
			this->is_active = false;
			return false;
		}
	}
};

static ros::NodeHandle *node_pointer;
ros::ServiceClient *client_pointer;
ros::Publisher *marker_pub_pointer;
ros::Publisher *stepper_control_pointer;
ros::Publisher *biometrics_pointer;
ros::Publisher *gestures_pointer;
ros::Publisher *external_control_pointer;
static bool biometrics_lock = false;
bool &biometrics_lock_ref = biometrics_lock;


poi_t *main_poi = NULL;
poi_t *secondary_poi = NULL;
std::vector<poi_t> poi_repository;
std::vector<area_t> area_repository;


/* Draws a  rough approximation of presentation areas for visualization purposes */
void visualize_areas() {
	int id = 2;
	for(auto &area : area_repository) {
		visualization_msgs::Marker line_strip;
		line_strip.header.frame_id = "/laser";
		line_strip.header.stamp = ros::Time::now();
		line_strip.ns = "areas_of_interest";
		line_strip.action = visualization_msgs::Marker::ADD;
		line_strip.pose.orientation.w = 0.5;
		line_strip.id = id++;
		line_strip.type = visualization_msgs::Marker::LINE_STRIP;
		line_strip.scale.x = 0.1;
		line_strip.color = area.c;
		if (area.is_active) {
			line_strip.color.a = 0.7f;
		} else {
			line_strip.color.a = 0.3f;
		}
		geometry_msgs::Point p;
		p.z = 0;
		p.x = area.r_min * cos(area.th_min);
		p.y = area.r_min * sin(area.th_min);
		line_strip.points.push_back(p);
		p.x = area.r_min * cos(area.th_max);
		p.y = area.r_min * sin(area.th_max);
		line_strip.points.push_back(p);
		p.x = area.r_max * cos(area.th_max);
		p.y = area.r_max * sin(area.th_max);
		line_strip.points.push_back(p);
		p.x = area.r_max * cos(area.th_min);
		p.y = area.r_max * sin(area.th_min);
		line_strip.points.push_back(p);
		p.x = area.r_min * cos(area.th_min);
		p.y = area.r_min * sin(area.th_min);
		line_strip.points.push_back(p);
		marker_pub_pointer->publish(line_strip);
	}
}

float point_distance(std::pair<float,float> from, std::pair <float,float> to){
	return std::sqrt(std::pow(from.first - to.first,2) + std::pow(from.second - to.second,2));
}

int index_of_shortest_to_sensor (std::vector<float> vector_x, std::vector<float> vector_y) {
	int smallest_index;
	float cur_distance;         // selection sort, bleh
	float smallest_distance = 10000.0;
	for(int i = 0; i < vector_x.size(); i++) {
		cur_distance = point_distance(
		        std::make_pair(vector_x[i], vector_y[i]),
		        std::make_pair(0.0f, 0.0f));
		if(cur_distance < smallest_distance) {
			smallest_index = i;
			smallest_distance = cur_distance;
		}
	}
	return smallest_index;
}
int index_of_shortest_to_point(std::vector<float> vector_x,
                               std::vector<float> vector_y, poi_t &point) {
	int smallest_index = 0;
	float cur_distance;                                                         // selection sort, bleh
	float smallest_distance = 10000.0;
	for(int i = 0; i < vector_x.size(); i++) {
		cur_distance = point_distance(
		        std::make_pair(vector_x[i], vector_y[i]),
		        point.poi_pos);
		if(cur_distance < smallest_distance) {
			smallest_index = i;
			smallest_distance = cur_distance;
		}
	}
	if(smallest_distance > POI_THRESHOLD) {
		return -1;
	}
	return smallest_index;
}

float angle_of_point(std::pair<float, float> point) {
	return std::ceil(atan(point.second/point.first)*1000);
}

void tracker_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
	laser_scanner_infoscreen::trackObjects srv;
	srv.request.angle_min = scan->angle_min;
	srv.request.angle_max = scan->angle_max;
	srv.request.angle_increment = scan->angle_increment;

	srv.request.time_increment = scan->time_increment;
	srv.request.scan_time = scan->scan_time;

	srv.request.ranges = scan->ranges;
	if (client_pointer->call(srv))
	{
		// ROS_DEBUG("Found %d objects", (int) srv.response.mobiles_x.size());
		ROS_DEBUG("Found %d mobile and %d static objects", (int) srv.response.mobiles_x.size(), (int) srv.response.statics_x.size());
		visualization_msgs::Marker points;
		std_msgs::ColorRGBA c;
		if (srv.response.mobiles_x.size() > 0) {
			int smallest_index = index_of_shortest_to_sensor(srv.response.mobiles_x,
			                                                 srv.response.mobiles_y);
				std::pair<float,float> closest_pos (srv.response.mobiles_x[smallest_index],
				                                    srv.response.mobiles_y[smallest_index]);
				if(!main_poi) {
					main_poi = new poi_t(closest_pos);
				} else if ( point_distance (closest_pos,main_poi->poi_pos) < POI_THRESHOLD) {
					// ROS_INFO("test: [%.2f %.2f]", main_poi->poi_pos.first,
					//          main_poi->poi_pos.second);
					main_poi->poi_pos = closest_pos;
					main_poi->timeout = 0.0f;
				} else {
					ROS_INFO("main_poi not closest, closest d %f, timeout %f", point_distance (closest_pos,main_poi->poi_pos), main_poi->timeout);
					if (!secondary_poi || point_distance(closest_pos, secondary_poi->poi_pos)
				    	> POI_THRESHOLD) {
						if (secondary_poi) {
							delete secondary_poi;
						}
						secondary_poi = new poi_t(closest_pos);
						ROS_INFO("new secondary_poi, d = %f",point_distance(closest_pos, secondary_poi->poi_pos));
						main_poi->timeout = 0.0f;
					} else if (point_distance(closest_pos, secondary_poi->poi_pos) < POI_THRESHOLD) {
						secondary_poi->poi_pos = closest_pos;
					}
					int main_poi_index = index_of_shortest_to_point(srv.response.mobiles_x,
					                                                srv.response.mobiles_y,
					                                                *main_poi);
					if(main_poi_index == -1 || (main_poi->timeout > TIMEOUT_LIMIT && secondary_poi)) {
						if (main_poi) {
							delete main_poi;
						}
						main_poi = secondary_poi;
						secondary_poi = NULL;
					} else {
						std::pair<float,float> closest_main_pos (srv.response.mobiles_x[main_poi_index],
						                                         srv.response.mobiles_y[main_poi_index]);
						main_poi->timeout += scan->scan_time;
					}
				}
				bool area_set_flag = false;
				int zoom = (int) (point_distance(main_poi->poi_pos, std::make_pair(0,0)) * 100 - PRESENTATION_RANGE / (MAX_RANGE - PRESENTATION_RANGE));
				for(auto & area : area_repository) {
					area.test_poi(*main_poi);
					area_set_flag = area_set_flag || area.is_active;
					if(area.is_active && area.id != area_last_active_id) {
						area_last_active_id = area.id;
						laser_scanner_infoscreen::external_control ex_msg;
						ex_msg.zoom_level = 0; // not implemented (yet)
						ex_msg.area_active = area.id;
						ex_msg.gesture = 0;

						external_control_pointer->publish(ex_msg);
					}

				}
				if (!area_set_flag && area_last_active_id != 4 &&
						point_distance(main_poi->poi_pos, std::make_pair(0,0)) < PRESENTATION_RANGE) {
					area_last_active_id = 4;
					laser_scanner_infoscreen::external_control ex_msg;
					ex_msg.zoom_level = 0; // not implemented (yet)
					ex_msg.area_active = 4;
					ex_msg.gesture = 0;
					external_control_pointer->publish(ex_msg);
				} else if (!area_set_flag && area_last_active_id != 6 &&
						point_distance(main_poi->poi_pos, std::make_pair(0,0)) < MAX_RANGE &&
						point_distance(main_poi->poi_pos, std::make_pair(0,0)) > PRESENTATION_RANGE) {
					area_last_active_id = 6;
					laser_scanner_infoscreen::external_control ex_msg;
					ex_msg.zoom_level = zoom; // not implemented (yet)
					ex_msg.area_active = 6;
					ex_msg.gesture = 0;
					external_control_pointer->publish(ex_msg);
				}
				if (area_last_active_id == 6) {
					laser_scanner_infoscreen::external_control ex_msg;
					ex_msg.zoom_level = zoom; // not implemented (yet)
					ex_msg.area_active = 6;
					ex_msg.gesture = 0;
					external_control_pointer->publish(ex_msg);
				}
		}
		points.header.frame_id ="/laser";
		points.header.stamp = ros::Time::now();
		points.ns = "points_and_lines";
		points.action = visualization_msgs::Marker::ADD;
		points.pose.orientation.w =1.0;
		points.id = 0;
		points.type = visualization_msgs::Marker::POINTS;
		points.scale.x = 0.2;
		points.scale.y = 0.2;
		c.r = 1.0f;
		c.g = 0.6f;
		c.a = 1.0f;
		// ROS_INFO("biometrics_lock: %d", (int) biometrics_lock_ref);
		if (main_poi) {
			if(HAS_SCREEN_CONTROL && (stepper_filter % 3) == 0) {
			 std_msgs::Int16 sc_msg;
			 sc_msg.data = -angle_of_point(main_poi->poi_pos);
			//  ROS_INFO("angle %d", sc_msg.data);
			 stepper_control_pointer->publish(sc_msg);
			 stepper_filter = 0;
		 } else {
			 stepper_filter++;
		 }
		 	if (biometrics_lock_ref && biometrics_timestamp + ros::Duration(5) > ros::Time::now()) {
				biometrics_lock_ref = false;
			}
			if((!biometrics_lock_ref && main_poi->height < 0.1f) && BIOMETRICS_FLAG) {
				laser_scanner_infoscreen::biometrics bio_msg;
				bio_msg.poi_angle = angle_of_point(main_poi->poi_pos);
				bio_msg.poi_range = point_distance(main_poi->poi_pos, std::make_pair(0.0f, 0.0f));
				main_poi->biometrics_id = biometrics_id_count++;
				bio_msg.id = main_poi->biometrics_id;
				biometrics_pointer->publish(bio_msg);
				biometrics_lock_ref = true;
			}
			if(GESTURES_ENABLED && !biometrics_lock_ref) {
				laser_scanner_infoscreen::gesture_call g_msg;
				g_msg.poi_angle = angle_of_point(main_poi->poi_pos)/1000.0f;
				g_msg.poi_range = point_distance(main_poi->poi_pos, std::make_pair(0.0f, 0.0f));
				g_msg.is_tracking = (int) (g_msg.poi_range > 0.5f && g_msg.poi_range < 2.0f);
				ROS_DEBUG("poi_range %f, is_tracking: %d, low: %d, high: %d", g_msg.poi_range, (int) g_msg.is_tracking
																								, (int) (g_msg.poi_range > 0.5f),
																								 (int) (g_msg.poi_range < 2.0f));
				gestures_pointer->publish(g_msg);
			}

			geometry_msgs::Point p_poi;
			p_poi.z =0;
			p_poi.x = main_poi->poi_pos.first;
			p_poi.y = main_poi->poi_pos.second;
			points.points.push_back(p_poi);
			points.colors.push_back(c);
		}

		c.r = 0.0f;
		c.g = 1.0f;
		c.a = 0.2f;
		for (int i = 0; i < srv.response.mobiles_x.size(); i++) {
			geometry_msgs::Point p;
			p.z = 0;
			p.x = srv.response.mobiles_x[i];
			p.y = srv.response.mobiles_y[i];
			points.points.push_back(p);
			points.colors.push_back(c);
		}
		c.g = 0.0;
		c.r = 1.0;
		for (int i = 0; i < srv.response.statics_x.size(); i++) {
			geometry_msgs::Point p;
			p.z = 0;
			p.x = srv.response.statics_x[i];
			p.y = srv.response.statics_y[i];
			points.points.push_back(p);
			points.colors.push_back(c);
		}
		marker_pub_pointer->publish(points);
		visualize_areas();
	}
	else
	{
		ROS_ERROR("Failed to call service track_objects");
	}
	ROS_DEBUG("constructed: %d, destructed: %d", poi_constructed, poi_destructed);
}

void biometrics_callback(const laser_scanner_infoscreen::biometrics_results::ConstPtr& msg)
{
	if (main_poi && main_poi->biometrics_id == msg->id) {
		main_poi->height = msg->height;
		ROS_INFO("Biometrics lock released: biometrics_lock_ref: %d", biometrics_lock_ref);
	}
	biometrics_lock_ref = false;
}

int main(int argc, char **argv)
{
	std::this_thread::sleep_for(std::chrono::milliseconds(4500));
	std_msgs::ColorRGBA c;
	c.r = 1.0f;
	c.g = 1.0f;
	std::string area_name("servo_and_steppers");
	float r_min = 1.0f;
	float r_max = 2.0f;
	area_t a1(r_min, r_max, -M_PI/3.0f, -M_PI/9.0f, c, area_name, 1);
	area_repository.push_back(a1);
	c.r = 0.0f;
	c.b = 1.0f;
	area_name.assign("3D_print");
	area_t a2(r_min, r_max, -M_PI/9.0f, M_PI/9.0f, c, area_name, 2);
	area_repository.push_back(a2);
	c.g = 0.0f;
	c.r = 1.0f;
	area_name.assign("laser_scanners");
	area_t a3(r_min, r_max, M_PI/9.0f, M_PI/3.0f,c, area_name, 3);
	area_repository.push_back(a3);
	ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
	node_pointer = &n;
	ros::ServiceClient client = node_pointer->serviceClient<laser_scanner_infoscreen::trackObjects>("track_objects");
	client_pointer = &client;
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
	marker_pub_pointer = &marker_pub;
	ros::Subscriber sub = n.subscribe("scan", 1000, tracker_callback);
	laser_scanner_infoscreen::trackObjects srv;
	ros::Publisher stepper_pub = n.advertise<std_msgs::Int16>("stepper", 10);
	ros::Publisher biometrics = n.advertise<laser_scanner_infoscreen::biometrics>("biometrics", 10);
	ros::Publisher gestures = n.advertise<laser_scanner_infoscreen::gesture_call>("gesture_control", 10);
	ros::Publisher external_control = n.advertise<laser_scanner_infoscreen::external_control>("external_control",10);
	biometrics_pointer = &biometrics;
	gestures_pointer = &gestures;
	external_control_pointer = &external_control;
	ros::Subscriber bio_sub = n.subscribe("biometrics_results", 10, biometrics_callback);
	stepper_control_pointer = &stepper_pub;
	while(ros::ok()) {
		ros::spinOnce();
	}
	if(main_poi) {
		delete main_poi;
	}
	if(secondary_poi) {
		delete secondary_poi;
	}
	return 0;
}
