#include "scanner_gestures.h"
#include <cmath>
#include <algorithm>

#define DIST_MULTI 0.25f
#define DECAY_CONST 1

Scanner_gestures::Scanner_gestures() :
	right_score(0.0f),
	left_score(0.0f),
	poi_range(0.0f),
	poi_angle(0.0f),
	is_tracking(false)
{right_closest = std::make_pair(0, 0);
left_closest = std::make_pair(0, 0); };

bool Scanner_gestures::is_in_tracking_area(int index)
{
	return this->slice[index] < this->poi_range + GESTURE_TRACKING_LENGTH / 2 && this->slice[index] > this->poi_range - GESTURE_TRACKING_LENGTH / 2;
}

float Scanner_gestures::delta_h(float angle_increment, int index)
{
	int mid = this->slice.size()/2;
	if (index < 0 || index > this->slice.size() - 1) {
		return 0.0f;
	}
	return this->slice[index] * sin((index - mid)*angle_increment);
}

void Scanner_gestures::update_score(float angle_increment)
{
	int left_closest_i = 0;
	float left_closest = 10000;
	int mid_i = this->slice.size() / 2;
	for (int i = 0; i < mid_i; i++) {
		if (this->slice[i] < left_closest && is_in_tracking_area(i) ) {
			left_closest_i = i;
		}
	}
	float left_dh = delta_h(angle_increment, left_closest_i);
	this->left_score = std::max(0.0f, this->left_score + std::max(0.0f, this->left_closest.second - left_dh)*DIST_MULTI - DECAY_CONST);
	this->left_closest = std::make_pair(left_dh, left_closest *cos((left_closest_i - mid_i)*angle_increment));

	int right_closest_i = mid_i;
	float right_closest = 10000;
	for (int i = right_closest_i + 1 ; i < this->slice.size(); i++) {
		if (this->slice[i] < right_closest && is_in_tracking_area(i) ) {
			right_closest_i = i;
		}
	}
	float right_dh = delta_h(angle_increment, right_closest_i);
	this->right_score = std::max(0.0f, this->right_score + std::max(0.0f, right_dh - this->right_closest.second)*DIST_MULTI - DECAY_CONST);
	this->right_closest = std::make_pair(right_dh, right_closest*cos((right_closest_i - mid_i)*angle_increment));
}

std::pair<int, int> Scanner_gestures::create_slice_indices(float angle_start, float angle_increment)
{
	float alpha = atan(GESTURE_TRACKING_WIDTH / (2 * this->poi_range));
	int increments = ceil(alpha / angle_increment);
	int poi_index = ceil((this->poi_angle - angle_start) / angle_increment);
	return std::make_pair(poi_index - increments, poi_index + increments);
}

void Scanner_gestures::parse_sensor_data(std::vector<float> range, float angle_start, float angle_increment, float poi_range, float poi_angle)
{
	this->poi_range = poi_range;
	this->poi_angle = poi_angle;
	std::pair<int, int> slice_i = this->create_slice_indices(angle_start, angle_increment);
	this->slice.assign(range.begin() + slice_i.first, range.begin() + slice_i.second);
	this->is_tracking = true;
}

gest_e Scanner_gestures::get_gesture(float threshold)
{
	if (this->right_score > this->left_score && this->right_score > threshold) {
		return RIGHT_GESTURE;
	}
	else if (this->left_score > threshold) {
		return LEFT_GESTURE;
	}
	return NO_GESTURE;
}

void Scanner_gestures::set_tracking(bool is_tracking)
{
	this->is_tracking = is_tracking;
}

bool Scanner_gestures::get_tracking()
{
	return this->is_tracking;
}