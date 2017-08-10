#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include <visualization_msgs/Marker.h>
#include <vector>
#include <cmath>
#include <utility>
#include <armadillo>
#include "laser_objects.hpp"

ros::Publisher *marker_pub_pointer;
laser_objects *repository = NULL;

bool track(laser_scanner_infoscreen::trackObjects::Request  &req,
           laser_scanner_infoscreen::trackObjects::Response &res)
{
	if (!repository) {
		repository = new laser_objects(req.time_increment);
	}
	visualization_msgs::Marker line_list;
	float beg_arc, end_arc;
	float beg_angle, end_angle;
	float angle_increment = req.angle_increment;
	std::vector<float> ranges;

	line_list.header.frame_id = "/laser";
	line_list.header.stamp = ros::Time::now();
	line_list.ns = "points_and_lines";
	line_list.action = visualization_msgs::Marker::ADD;
	line_list.pose.orientation.w = 0.5;
	line_list.id = 1;
	line_list.type = visualization_msgs::Marker::LINE_LIST;
	line_list.scale.x = 0.1;
	line_list.color.b = 1.0;
	line_list.color.a = 0.3;
	beg_angle = end_angle = req.angle_min;
	beg_arc = req.ranges[0];
	end_arc = req.ranges[0];
	ranges.push_back(beg_arc);
	for (float range : req.ranges) {
		if (std::abs(end_arc - range) < 0.25) {
			end_arc = range;
			ranges.push_back(range);
			end_angle = end_angle + angle_increment;
		} else {
			if(ranges.size() > 15 && ranges.size() < 100) {
				geometry_msgs::Point p;
				p.z = 0;
				p.x = -ranges[0] * sin(beg_angle);
				p.y = ranges[0] * cos(beg_angle);
				line_list.points.push_back(p);
				p.x = -ranges[ranges.size() - 1] * sin(end_angle);
				p.y = ranges[ranges.size() - 1] * cos(end_angle);
				line_list.points.push_back(p);
				float sum_x = 0.0;
				float sum_y = 0.0;
				for (int i = 0; i < ranges.size(); i++) {
					sum_x += ranges[i] * -sin(beg_angle + i*angle_increment);
					sum_y += ranges[i] * cos(beg_angle + i*angle_increment);
				}
				if (sum_x) {
					marker_pub_pointer->publish(line_list);
					repository->update(std::make_pair(sum_x/ranges.size(), sum_y/ranges.size()));
				}
				//ROS_INFO("found object at: [%f, %f]", (float)sum_x / ranges.size(), (float)sum_y / ranges.size());
			}
			beg_angle = end_angle + angle_increment;
			end_angle = beg_angle;
			beg_arc = range;
			end_arc = beg_arc;
			ranges.clear();
			ranges.push_back(range);
		}

	}
	repository->update_repository();
	res.mobiles_x = repository->get_mobiles_x();
	res.mobiles_y = repository->get_mobiles_y();
	res.statics_x = repository->get_statics_x();
	res.statics_y = repository->get_statics_y();
	return true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_server");
	ros::NodeHandle n;

	ros::ServiceServer service = n.advertiseService("track_objects", track);
	ROS_INFO("Ready to track objects.");
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("vizualization_objects", 10);
	marker_pub_pointer = &marker_pub;
	ros::spin();

	return 0;
}
