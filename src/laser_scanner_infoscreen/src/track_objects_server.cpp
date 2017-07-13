#include "ros/ros.h"
#include "laser_scanner_infoscreen/trackObjects.h"
#include <vector>
#include <cmath>
#include <utility>

struct laser_object_t 
{
	float start_angle;
	float end_angle;
	std::vector<float> ranges;
	std::pair<float, float> pos_centerofmass;
	std::pair<float, float> vel_centerofmass;
};

std::vector<struct laser_object_t> objects;

bool(laser_scanner_infoscreen::trackObjects::Request  &req,
	laser_scanner_infoscreen::trackObjects::Response &res)
{
	float beg_arc, end_arc;
	float beg_angle, end_angle;
	float angle_increment = req.angle_increment;
	std::vector<float> ranges;

	beg_angle = end_angle = req.angle_min;
	beg_arc = end_arc = req.ranges[0];
	ranges.push_back(beg_arc);
	for (float range : req.ranges) {
		if (end_arc - range < 0.05{
			end_arc = range;
			ranges.push_back(range);
			end_angle = end_angle + angle_increment;
		}
		else {
			float sum_x = 0;
			float sum_y = 0;
			for (int i = 0; i < ranges.size; i++) {
				sum_x = sum_x + ranges(i) * cos(beg_angle + i*angle_increment);
				sum_y = sum_y + ranges(i) * sin(beg_angle + i*angle_increment);
			}
			laser_object new_object = { beg_angle, end_angle, ranges, std::make_pair(sum_x / ranges.size, sum_y / ranges.size), std::make_pair(0,0) };
			objects.push_back(new_object);
		}
	}


}