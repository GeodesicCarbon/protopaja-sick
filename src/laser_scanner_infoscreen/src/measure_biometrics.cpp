#include "ros/ros.h"
#include "ros/topic.h"
#include "sensor_msgs/LaserScan.h"
#include "laser_scanner_infoscreen/biometrics.h"
#include "laser_scanner_infoscreen/biometrics_results.h"
#include "laser_scanner_infoscreen/servo_control.h"
#include <cstdlib>
#include <visualization_msgs/Marker.h>
#include <math.h>

static ros::NodeHandle *node_pointer;
ros::Publisher *marker_pub_pointer;
ros::Publisher *servo_control_pointer;
static int binary_depth = 5;
static std::vector<float> sensor_pos = {0.0,0.0,1.7}; // upper sensor offset in {x,y,z}


int set_tilt_uppper_scanner(float rad) {
  ROS_INFO("Simulating sensor tilt, press any key");
  getchar();
  return -1;
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
    ROS_INFO("Testing for h = %f", mid);
    set_tilt_uppper_scanner(acos(mid - sensor_pos[2]));
    scan = ros::topic::waitForMessage<sensor_msgs::LaserScan>("/scan_upper", *node_pointer);
    low_index =  scan->ranges.size()/2-10;
    high_index = low_index + 20;
    for (int j = low_index; j <= high_index; j++) {
      if (abs(scan->ranges[j] - poi->poi_angle) < 0.2) {
        hit_count++;
      }
    }
    ROS_INFO("hit count %d", hit_count);
    if (hit_count > 5) {
      high = mid;
    } else {
      low = mid;
    }
  }
  ROS_INFO("Measured height = %f", high);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "measure_biometrics");
	ros::NodeHandle n;
	node_pointer = &n;
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
  marker_pub_pointer = &marker_pub;
  ROS_INFO("HELLO THERE");
  ros::Subscriber sub = n.subscribe("biometrics", 1000, biometrics_callback);
	ros::spin();
	return 0;
}
