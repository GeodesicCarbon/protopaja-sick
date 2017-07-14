#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>

ros::NodeHandle n;
ros::ServiceClient client;
laser_scanner_infoscreen::trackObjects srv;

void tracker_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
	srv.request.angle_min = scan->angle_min;
	srv.request.angle_min = scan->angle_max;
	srv.request.angle_increment = scan->angle_increment;

	srv.request.time_increment = scan->time_increment;
	srv.request.scan_time = scan->scan_time;

	srv.request.ranges = scan->ranges;
	if (client.call(srv))
	{
		ROS_INFO("Found %d objects", srv.response.mobiles_x.size());
	}
	else
	{
		ROS_ERROR("Failed to call service track_objects");
		return 1;
	}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_client");
	client = n.serviceClient<laser_scanner_infoscreen::trackObjects>("track_objects_client");
	ros::Subscriber sub = n.subscribe("scan", 1000, tracker_callback);
	ros::spin();
	return 0;
}