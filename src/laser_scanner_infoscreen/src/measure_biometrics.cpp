#include "ros/ros.h"
#include "ros/topic.h"
#include "sensor_msgs/LaserScan.h"
#include "laser_scanner_infoscreen/biometrics.h"
#include "laser_scanner_infoscreen/biometrics_results.h"
#include "laser_scanner_infoscreen/servo_control.h"
#include "laser_scanner_infoscreen/servo_feedback.h"
#include <cstdlib>
#include <visualization_msgs/Marker.h>
#include <math.h>
#include <chrono>
#include <thread>

#define servo_speed_const 5235

static ros::NodeHandle *node_pointer;
ros::Publisher *marker_pub_pointer;
ros::Publisher *servo_control_pointer;
static int binary_depth = 5;
static float level_offset_z = 0.85;
static std::vector<float> sensor_pos = {0.0,-0.2,0.75}; // upper sensor offset in {x,y,z}
struct servo_angle_t {
  bool is_read = 0;
  float angle = 0.0f;
} servo_angle;


float calculate_range( float angle_h, float low_range) {
  return std::sqrt(std::pow(low_range * sin(angle_h) + sensor_pos[0],2) +
                    std::pow(low_range * cos(angle_h) + sensor_pos[1],2) +
                    std::pow(sensor_pos[2] + level_offset_z,2));
}

float set_tilt_uppper_scanner(float rad) {
  laser_scanner_infoscreen::servo_control msg;
  msg.servo_angle = std::ceil(rad*1000);
  msg.servo_speed = servo_speed_const;
  servo_control_pointer->publish(msg);
  ROS_INFO("Waiting for servo");
  if (servo_angle.is_read) {
    usleep(10);
  }
  servo_angle.is_read = true;
  ROS_INFO("Received servo angle");
  return servo_angle.angle;
}

void biometrics_callback(const laser_scanner_infoscreen::biometrics::ConstPtr& poi)
{
  float low = 0.5;
  float high = 2.2;
  int low_index;
  int high_index;
  sensor_msgs::LaserScan::ConstPtr scan;
  for (int i = 0; i < binary_depth; i++) {
    float mid = (low + high)/2;
    int hit_count = 0;
    ROS_INFO("Testing for h = %f", mid+ level_offset_z);
    float scan_range = calculate_range(poi->poi_angle, poi->poi_range);
    mid = sin(set_tilt_uppper_scanner(asin((mid - sensor_pos[2])/scan_range)))*scan_range;
    scan = ros::topic::waitForMessage<sensor_msgs::LaserScan>("/scan_upper", *node_pointer);
    int d_index = std::ceil(1.0f/(scan_range*2*scan->angle_increment));
    low_index =  std::ceil((poi->poi_angle  - scan->angle_min)/scan->angle_increment) - d_index;
    high_index = low_index + d_index;
    for (int j = low_index; j <= high_index; j++) {
      if (abs(scan->ranges[j] - scan_range) < 0.2) {
        hit_count++;
      }
    }
    ROS_INFO("hit count %d", hit_count);
    if (hit_count < 5) {
      high = mid;
    } else {
      low = mid;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
  }
  ROS_INFO("Measured height = %f", high + level_offset_z);
}

void servo_feedback_callback(const laser_scanner_infoscreen::servo_feedback& msg) {
  servo_angle.angle = msg.servo_angle/1000.0f;
  servo_angle.is_read = false;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "measure_biometrics");
	ros::NodeHandle n;
	node_pointer = &n;
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
  ros::Publisher servo_pub = n.advertise<laser_scanner_infoscreen::servo_control>("servo_control", 10);
  ros::Subscriber servo_feedback = n.subscribe("servo_position", 100, servo_feedback_callback);
  marker_pub_pointer = &marker_pub;
  servo_control_pointer = &servo_pub;
  ROS_INFO("HELLO THERE");
  ros::Subscriber sub = n.subscribe("biometrics", 1000, biometrics_callback);
	ros::spin();
	return 0;
}
