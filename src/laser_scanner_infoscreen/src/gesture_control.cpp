#include "ros/ros.h"
// #include "laser_scanner_infoscreen/servo_control.h"
// #include "laser_scanner_infoscreen/servo_feedback.h"
#include "scanner_gestures.h"
#include "laser_scanner_infoscreen/gesture_call.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>
#include <cmath>
#include <visualization_msgs/Marker.h>
#include <string>

#define timeout_limit  4
#define gesture_score_threshold 1.0f

static Scanner_gestures* gestures;
static ros::NodeHandle *node_pointer;
ros::Publisher *marker_pub_pointer;
ros::Publisher *servo_control_pointer;
ros::Subscriber *gesture_control_pointer;

static std::vector<float> sensor_pos = {0.0,-0.5,1.7};

struct poi_t {
  float poi_range;
  float poi_angle;
} poi;

void gestures_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
  visualization_msgs::Marker points;
	std_msgs::ColorRGBA c;
	points.header.frame_id ="/laser";
	points.header.stamp = ros::Time::now();
	points.ns = "points_and_lines";
	points.action = visualization_msgs::Marker::ADD;
	points.pose.orientation.w =1.0;
	points.id = 0;
	points.type = visualization_msgs::Marker::POINTS;
	points.scale.x = 0.2;
	points.scale.y = 0.2;

  ROS_INFO("Tracking enabled: %d", (int) gestures->get_tracking());
  if (gestures->get_tracking()) {
    gestures->parse_sensor_data(scan->ranges, scan->angle_min, scan->angle_increment, poi.poi_range, poi.poi_angle);
    ROS_INFO("right_closest: (%.3f, %.3f), left_closest: (%.3f, %.3f)",
              gestures->get_right_closest().first,
              gestures->get_right_closest().second,
              gestures->get_left_closest().first,
              gestures->get_left_closest().second);
    c.r = 1.0f;
  	c.a = 1.0f;
  	geometry_msgs::Point p;
  	p.z =0;
  	p.y = gestures->get_right_closest().first;
  	p.x = gestures->get_right_closest().second;
  	points.points.push_back(p);
  	points.colors.push_back(c);

    c.g = 1.0f;
  	c.r = 0.0f;
  	c.a = 1.0f;

  	p.z =0;
  	p.y = gestures->get_left_closest().first;
  	p.x = gestures->get_left_closest().second;
  	points.points.push_back(p);
  	points.colors.push_back(c);
    marker_pub_pointer->publish(points);
  }
  switch (gestures->get_gesture(gesture_score_threshold)) {
    case LEFT_GESTURE : ROS_INFO("Detected left gesture");
                                          break;
    case RIGHT_GESTURE : ROS_INFO("Detected left gesture");
                                          break;
    case NO_GESTURE :
                                          break;
  }
}

void control_callback(const laser_scanner_infoscreen::gesture_call& msg)
{
  poi.poi_range = std::sqrt(std::pow(msg.poi_range * sin(msg.poi_angle) + sensor_pos[0],2) + 
                            std::pow(msg.poi_range * cos(msg.poi_angle) + sensor_pos[1],2) +
                            std::pow(sensor_pos[2],2));
  poi.poi_angle = msg.poi_angle;
  gestures->set_tracking(msg.is_tracking);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
	node_pointer = &n;
  gestures = new Scanner_gestures();

	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_gesture", 10);
	marker_pub_pointer = &marker_pub;
	 ros::Subscriber sub = n.subscribe("scan_upper", 1000, gestures_callback);
   ros::Subscriber gesture_control = n.subscribe("gesture_control", 100, control_callback);
	ros::spin();
  delete gestures;
	return 0;
}
