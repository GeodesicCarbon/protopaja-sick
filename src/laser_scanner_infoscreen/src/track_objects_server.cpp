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

float cart_dist(float x1, float x2, float y1, float y2) {
  return std::sqrt( std::pow(x2-x1,2) + std::pow(y2-y1,2));
}

bool track(laser_scanner_infoscreen::trackObjects::Request  &req,
           laser_scanner_infoscreen::trackObjects::Response &res)
{
	if (!repository) {
		repository = new laser_objects(req.scan_time);
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
	line_list.id = 5;
	line_list.type = visualization_msgs::Marker::LINE_LIST;
	line_list.scale.x = 0.1;
	line_list.color.b = 1.0;
	line_list.color.a = 0.8;
	int start_index = 0;
	while(start_index * angle_increment + req.angle_min < -(1.0/3.0)*M_PI) {
		start_index++;
	}
	int end_index = start_index;
	while(end_index * angle_increment + req.angle_min < (1.0/3.0)*M_PI) {
		end_index++;
	}
	std::vector<float> front_ranges(req.ranges.begin()+start_index, req.ranges.begin()+end_index);
	// beg_angle = end_angle = req.angle_min;
	beg_angle = end_angle = req.angle_min + start_index*angle_increment;
	beg_arc = front_ranges[0];
	end_arc = front_ranges[0];
	// beg_arc = req.ranges[0];
	// end_arc = req.ranges[0];
	ranges.push_back(beg_arc);
	// for (float range : req.ranges) {
	for (float range : front_ranges) {
		if (std::abs(end_arc - range) < 0.10) {
			end_arc = range;
			ranges.push_back(range);
			end_angle = end_angle + angle_increment;
		} else {
      float x1 = ranges[0] * cos(beg_angle);
      float x2 = ranges.back() * cos(beg_angle + angle_increment * ranges.size());
      float y1 = ranges[0] * sin(beg_angle);
      float y2 = ranges.back() * sin(beg_angle + angle_increment * ranges.size());
      float width = cart_dist(x1, x2, y1, y2);
      if(width > 0.3f && width < 0.7f) {
				geometry_msgs::Point p;
				p.z = 0;
				p.x = ranges[0] * cos(beg_angle);
				p.y = ranges[0] * sin(beg_angle);
				line_list.points.push_back(p);
				p.x = ranges[ranges.size() - 1] * cos(end_angle);
				p.y = ranges[ranges.size() - 1] * sin(end_angle);
				line_list.points.push_back(p);
				float sum_x = 0.0;
				float sum_y = 0.0;
				for (int i = 0; i < ranges.size(); i++) {
					sum_x += ranges[i] * cos(beg_angle + i*angle_increment);
					sum_y += ranges[i] * sin(beg_angle + i*angle_increment);
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
