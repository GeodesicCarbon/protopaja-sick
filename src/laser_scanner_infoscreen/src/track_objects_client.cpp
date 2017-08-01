#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>

static ros::NodeHandle *node_pointer;
ros::ServiceClient *client_pointer;

void tracker_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
	laser_scanner_infoscreen::trackObjects srv;
	std::cout << scan->angle_min << std::endl;
	srv.request.a = 1.0;
	// srv.request.angle_min = scan->angle_min;
	// srv.request.angle_min = scan->angle_max;
	// srv.request.angle_increment = scan->angle_increment;
	//
	// srv.request.time_increment = scan->time_increment;
	// srv.request.scan_time = scan->scan_time;
	//
	// srv.request.ranges = scan->ranges;
	if (client_pointer->call(srv))
	{
		// ROS_INFO("Found %d objects", (int) srv.response.mobiles_x.size());
		ROS_INFO("Found %d objects", (int) srv.response.b);
	}
	else
	{
		ROS_ERROR("Failed to call service track_objects");
	}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
	node_pointer = &n;
	ros::ServiceClient client = node_pointer->serviceClient<laser_scanner_infoscreen::trackObjects>("laser_scanner_infoscreen");
	client_pointer = &client;
	laser_scanner_infoscreen::trackObjects srv_a;
	srv_a.request.a = 1.0;
	if (client_pointer->call(srv_a))
	{
		// ROS_INFO("Found %d objects", (int) srv.response.mobiles_x.size());
		ROS_INFO("Found %d objects", (int) srv_a.response.b);
	}
	else
	{
		ROS_ERROR("Failed to call service track_objects");
	}
	ros::Subscriber sub = n.subscribe("scan", 1000, tracker_callback);
	laser_scanner_infoscreen::trackObjects srv;
	ros::spin();
	return 0;
}
