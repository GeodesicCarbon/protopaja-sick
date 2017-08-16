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

struct poi_t {
  float poi_range;
  float poi_angle;
} poi;

void gestures_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
  if (gestures->get_tracking()) {
    gestures->parse_sensor_data(scan->ranges, scan->angle_min, scan->angle_increment, poi.poi_range, poi.poi_angle);
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
  poi.poi_range = msg.poi_range;
  poi.poi_angle = msg.poi_angle;
  gestures->set_tracking(msg.is_tracking);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
	node_pointer = &n;
  gestures = new Scanner_gestures();
  
	// ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
	// marker_pub_pointer = &marker_pub;
	 ros::Subscriber sub = n.subscribe("scan_upper", 1000, gestures_callback);
   ros::Subscriber gesture_control = n.subscribe("gesture_control", 100, control_callback);
	ros::spin();
  delete gestures;
	return 0;
}
