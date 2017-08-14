#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>
#include <cmath>
#include <visualization_msgs/Marker.h>
#include <string>

#define timeout_limit  4
#define poi_thershold 0.4f
static int poi_constructed = 0;
static int poi_destructed = 0;

struct poi_t {
	std::pair<float,float> poi_pos;
	float timeout;
	float height;
	poi_t(std::pair<float,float> pos) :
		poi_pos(pos),
		timeout(0.0f),
		height(0.0f)
	{
		poi_constructed++;
	};
	~poi_t()
	{
		poi_destructed++;
	}
};

struct area_t {
	float x_max, x_min, y_max, y_min;
	std_msgs::ColorRGBA c;
	std::string name;
	bool is_active;
	area_t(float draw_x_max, float draw_x_min, float draw_y_max, float draw_y_min,
	       std_msgs::ColorRGBA area_c, std::string area_name) :
		x_max(draw_x_max),
		x_min(draw_x_min),
		y_max(draw_y_max),
		y_min(draw_y_min),
		c(area_c),
		name(area_name),
		is_active(false)
	{
	};
	bool test_poi(poi_t &poi) {
		if (poi.poi_pos.first > this->x_min && poi.poi_pos.first < this->x_max
		    && poi.poi_pos.second > this->y_min && poi.poi_pos.second < this->y_max) {
			this->is_active = true;
			return true;
			ROS_INFO("Activated area %s", this->name.c_str());
		} else {
			this->is_active = false;
			return false;
		}
	}
};

static ros::NodeHandle *node_pointer;
ros::ServiceClient *client_pointer;
ros::Publisher *marker_pub_pointer;


poi_t *main_poi;
poi_t *secondary_poi;
std::vector<poi_t> poi_repository;
std::vector<area_t> area_repository;

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
		p.x = area.x_min;
		p.y = area.y_min;
		line_strip.points.push_back(p);
		p.x = area.x_max;
		p.y = area.y_min;
		line_strip.points.push_back(p);
		p.x = area.x_max;
		p.y = area.y_max;
		line_strip.points.push_back(p);
		p.x = area.x_min;
		p.y = area.y_max;
		line_strip.points.push_back(p);
		p.x = area.x_min;
		p.y = area.y_min;
		line_strip.points.push_back(p);
		marker_pub_pointer->publish(line_strip);
	}
}

float point_distance(std::pair<float,float> from, std::pair <float,float> to){
	return std::sqrt(std::pow(from.first + to.first,2) + std::pow(from.second + to.second,2));
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
	if(smallest_distance > poi_thershold) {
		return -1;
	}
	return smallest_index;
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
		// ROS_INFO("Found %d objects", (int) srv.response.mobiles_x.size());
		ROS_INFO("Found %d mobile and %d static objects", (int) srv.response.mobiles_x.size(), (int) srv.response.statics_x.size());
		visualization_msgs::Marker points;
		std_msgs::ColorRGBA c;
		if (srv.response.mobiles_x.size() > 0) {
			int smallest_index = index_of_shortest_to_sensor(srv.response.mobiles_x,
			                                                 srv.response.mobiles_y);
				std::pair<float,float> closest_pos (srv.response.mobiles_x[smallest_index],
				                                    srv.response.mobiles_y[smallest_index]);
				if(!main_poi) {
					main_poi = new poi_t(closest_pos);
				} else if ( point_distance (closest_pos,main_poi->poi_pos) < poi_thershold) {
					ROS_INFO("test: [%.2f %.2f]", main_poi->poi_pos.first,
					         main_poi->poi_pos.second);
					main_poi->poi_pos = closest_pos;
					main_poi->timeout = 0.0f;
				} else {
					if (!secondary_poi ||
					    point_distance(closest_pos, secondary_poi->poi_pos)
					    > poi_thershold) {
						if (!secondary_poi) {
							delete secondary_poi;
						}
						secondary_poi = new poi_t(closest_pos);
						main_poi->timeout = 0.0f;
					} else if (point_distance(closest_pos, secondary_poi->poi_pos) < poi_thershold) {
						secondary_poi->poi_pos = closest_pos;
					}
					int main_poi_index = index_of_shortest_to_point(srv.response.mobiles_x,
					                                                srv.response.mobiles_y,
					                                                *main_poi);
					if(main_poi_index == -1 || main_poi->timeout > timeout_limit) {
						delete main_poi;
						main_poi = secondary_poi;
					} else {
						std::pair<float,float> closest_main_pos (srv.response.mobiles_x[main_poi_index],
						                                         srv.response.mobiles_y[main_poi_index]);
						main_poi->timeout += scan->time_increment;
					}
					for(auto & area : area_repository) {
						area.test_poi(*main_poi);
					}
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
		if (main_poi) {
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
	ROS_INFO("constructed: %d, destructed: %d", poi_constructed, poi_destructed);
}

int main(int argc, char **argv)
{
	std_msgs::ColorRGBA c;
	c.r = 1.0f;
	c.g = 1.0f;
	std::string area_name("Area 1");
	area_t a1(3.0f, 0.0f, 2.0f, 1.0f, c, area_name);
	area_repository.push_back(a1);
	c.r = 0.0f;
	c.b = 1.0f;
	area_name.assign("Area 2");
	area_t a2(3.0f, 0.0f, 0.5f, -0.5f, c, area_name);
	area_repository.push_back(a2);
	c.g = 0.0f;
	c.r = 1.0f;
	area_name.assign("Area 3");
	area_t a3( 3.0f, 0.0f, -1.0f, -2.0f,c, area_name);
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
	ros::spin();
	return 0;
}
