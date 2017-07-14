#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include <vector>
#include <cmath>
#include <utility>

//struct laser_object_t 
//{
//	float start_angle;
//	float end_angle;
//	std::vector<float> ranges;
//	std::pair<float, float> pos_centerofmass;
//	std::pair<float, float> vel_centerofmass;
//};
//
//std::vector<struct laser_object_t> objects;

bool(laser_scanner_infoscreen::trackObjects::Request  &req,
	laser_scanner_infoscreen::trackObjects::Response &res)
{
	float beg_arc, end_arc;
	float beg_angle, end_angle;
	float angle_increment = req.angle_increment;
	std::vector<float> ranges;
	std::vector<float> mob_x;
	std::vector<float> mob_y;

	beg_angle = end_angle = req.angle_min;
	beg_arc = req.ranges[0];
	end_arc = req.ranges[0];
	ranges.push_back(beg_arc);
	for (float range : req.ranges) {
		if (end_arc - range < 0.05){
			end_arc = range;
			ranges.push_back(range);
			end_angle = end_angle + angle_increment;
		} else {
			float sum_x = 0;
			float sum_y = 0;
			for (int i = 0; i < ranges.size(); i++) {
				sum_x += ranges(i) * cos(beg_angle + i*angle_increment);
				sum_y += ranges(i) * sin(beg_angle + i*angle_increment);
			}
			mob_x.push_back(sum_x / ranges.size());
			mob_y.push_back(sum_y / ranges.size());
			ROS_INFO("found object at: [%f, %f]", (float)sum_x / ranges.size(), (float)sum_y / ranges.size());
			beg_angle = end_angle + angle_increment;
			end_angle = beg_angle;
			beg_arc = range;
			end_arc = beg_arc;
			ranges.clear();
			ranges.push_back(range);
			/*laser_object new_object = { beg_angle, end_angle, ranges, std::make_pair(sum_x / ranges.size, sum_y / ranges.size), std::make_pair(0,0) };
			objects.push_back(new_object);*/
		}

	}
	res.mobiles_x = mob_x;
	res.mobiles_y = mob_y;
	return true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "track_objects_server");
	ros::NodeHandle n;

	ros::ServiceServer service = n.advertiseService("track_objects", add);
	ROS_INFO("Ready to track objects.");
	ros::spin();

	return 0;
}