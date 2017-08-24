#include "ros/ros.h"
#include "laser_scanner_infoscreen/servo_control.h"
#include "laser_scanner_infoscreen/servo_feedback.h"
#include "laser_scanner_infoscreen/external_control.h"
#include "scanner_gestures.h"
#include "laser_scanner_infoscreen/gesture_call.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>
#include <cmath>
#include <visualization_msgs/Marker.h>
#include <string>


// Magic parameters for the gesture detect

#define timeout_limit  4
#define gesture_score_threshold 1.0f
#define servo_speed_const 5235
#define servo_loop_len 5

// Offset of the upper sensor in the relation of lower sensor
static std::vector<float> sensor_pos = {0.0,-0.22,0.72};
int loop_count = 0;

// Initializing global objects
static Scanner_gestures* gestures;
static ros::NodeHandle *node_pointer;
ros::Publisher *marker_pub_pointer;
ros::Publisher *servo_control_pointer;
ros::Subscriber *gesture_control_pointer;
ros::Publisher *external_control_pointer;
static ros::Time timelock;


// Parameters of the person of inrerest.
struct poi_t {
  float poi_range;
  float poi_angle;
} poi;

// Lock for the servo control (e.g. busy with biometrics)
struct servo_t {
  bool is_readable = false;
} servo;


// Scanner is read by default. If tracking is disabled, the data is discarded.
void gestures_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
  // Visualization
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

  ROS_DEBUG("Tracking enabled: %d", (int) gestures->get_tracking());
  if (gestures->get_tracking()) { // Discard or continue
    gestures->parse_sensor_data(scan->ranges, scan->angle_min, scan->angle_increment, poi.poi_range, poi.poi_angle);
     ROS_DEBUG("right_closest: (%.3f, %.3f), left_closest: (%.3f, %.3f)",
              gestures->get_right_closest().first,
              gestures->get_right_closest().second,
              gestures->get_left_closest().first,
              gestures->get_left_closest().second);

    // Visualization of gesture tracking points.
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
  // Actions upon score exceeding threshold score
  /* Due to miscomminication the gestures are reversed */
  if(timelock + ros::Duration(timeout_limit) < ros::Time::now()) {
    laser_scanner_infoscreen::external_control ex_msg;
    switch (gestures->get_gesture(gesture_score_threshold)) {
      case LEFT_GESTURE :
        ROS_INFO("Detected right gesture");
        timelock = ros::Time::now();
        ex_msg.zoom_level = 0; // not implemented (yet)
        ex_msg.area_active = 5;
        ex_msg.gesture = 1;
        external_control_pointer->publish(ex_msg);
        break;
      case RIGHT_GESTURE :
        ROS_INFO("Detected left gesture");
        timelock = ros::Time::now();
        ex_msg.zoom_level = 0; // not implemented (yet)
        ex_msg.area_active = 5;
        ex_msg.gesture = 2;
        external_control_pointer->publish(ex_msg);
        break;
      case 0 :
        break;
      default :
        break;
    }
  }
}

/* Servo control logic. If tracking is enabled servo is moved into gesture read
position. The angle of the upper scanner is kept so that the beam approximately
intersects with the lower scanner at the position of POI*/
void control_callback(const laser_scanner_infoscreen::gesture_call& msg)
{
  poi.poi_range = std::sqrt(std::pow(msg.poi_range * sin(msg.poi_angle) - sensor_pos[0],2) +
                            std::pow(msg.poi_range * cos(msg.poi_angle) - sensor_pos[1],2) +
                            std::pow(sensor_pos[2],2));
  ROS_DEBUG("poi_range: %.3f", poi.poi_range);
  poi.poi_angle = msg.poi_angle;
  laser_scanner_infoscreen::servo_control move;
  move.servo_angle = std::ceil(asin(-sensor_pos[2]/poi.poi_range)*1000);
  move.servo_speed = servo_speed_const;
  if (loop_count % servo_loop_len == 0) {
    servo.is_readable = false;  // Locks servo for readjusting
    servo_control_pointer->publish(move);
    loop_count = 0;
  }
  loop_count++;
  gestures->set_tracking(msg.is_tracking);
}

void servo_feedback_callback(const laser_scanner_infoscreen::servo_feedback& msg)
{
  servo.is_readable = true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
	node_pointer = &n;
  gestures = new Scanner_gestures();

	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_gesture", 10);
  ros::Publisher servo_pub = n.advertise<laser_scanner_infoscreen::servo_control>("servo_control", 10);
  ros::Publisher external_control = n.advertise<laser_scanner_infoscreen::external_control>("external_control",10);
  servo_control_pointer = &servo_pub;
  marker_pub_pointer = &marker_pub;
  external_control_pointer = &external_control;
	 ros::Subscriber sub = n.subscribe("scan_upper", 1000, gestures_callback);
   ros::Subscriber gesture_control = n.subscribe("gesture_control", 100, control_callback);
   ros::Subscriber servo_feedback = n.subscribe("servo_position", 100, servo_feedback_callback);
  ros::spin();
  delete gestures;
	return 0;
}
