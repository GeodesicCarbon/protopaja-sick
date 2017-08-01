#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include "sensor_msgs/LaserScan.h"
#include <cstdlib>
#include <visualization_msgs/Marker.h>

static ros::NodeHandle *node_pointer;
ros::ServiceClient *client_pointer;
ros::Publisher *marker_pub_pointer;

void tracker_callback(const sensor_msgs::LaserScan::ConstPtr& scan)
{

	laser_scanner_infoscreen::trackObjects srv;
	std::cout << scan->angle_min << std::endl;
	srv.request.angle_min = scan->angle_min;
	srv.request.angle_min = scan->angle_max;
	srv.request.angle_increment = scan->angle_increment;

	srv.request.time_increment = scan->time_increment;
	srv.request.scan_time = scan->scan_time;

	srv.request.ranges = scan->ranges;
	if (client_pointer->call(srv))
	{
		// ROS_INFO("Found %d objects", (int) srv.response.mobiles_x.size());
		ROS_INFO("Found %d objects", (int) srv.response.mobiles_x.size());
		visualization_msgs::Marker points;
		points.header.frame_id ="/laser";
		points.header.stamp = ros::Time::now();
		points.ns = "points_and_lines";
		points.action = visualization_msgs::Marker::ADD;
		points.pose.orientation.w =1.0;
		points.id = 0;
		points.type = visualization_msgs::Marker::POINTS;
		points.scale.x = 0.2;
		points.scale.y = 0.2;
		points.color.g = 1.0f;
	  points.color.a = 1.0;
		for (int i = 0; i < srv.response.mobiles_x.size(); i++) {
			geometry_msgs::Point p;
			p.z = 0;
			p.x = srv.response.mobiles_x[i];
			p.y = srv.response.mobiles_y[i];
			points.points.push_back(p);
		}
		marker_pub_pointer->publish(points);
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
	ros::ServiceClient client = node_pointer->serviceClient<laser_scanner_infoscreen::trackObjects>("track_objects");
	client_pointer = &client;
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
marker_pub_pointer = &marker_pub;
	ros::Subscriber sub = n.subscribe("scan", 1000, tracker_callback);
	laser_scanner_infoscreen::trackObjects srv;
	ros::spin();
	return 0;
}
