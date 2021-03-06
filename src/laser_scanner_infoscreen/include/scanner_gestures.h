#ifndef SCANNER_GESTURES_H
#define SCANNER_GESTURES_H
#include "ros/ros.h"

/*! \file scanner_gestures.h
*
*/

#define GESTURE_TRACKING_WIDTH 1.2f
#define GESTURE_TRACKING_LENGTH 0.9f
	enum gest_e
	{
		NO_GESTURE,
		LEFT_GESTURE,
		RIGHT_GESTURE
	};

class Scanner_gestures {
private:
	float right_score, left_score, poi_range, poi_angle;
	std::pair<float, float> right_closest, left_closest;
	std::vector<float> slice;
	bool is_tracking;
	bool is_in_tracking_area(int index);
	float delta_h(float angle_increment, int index);
	std::pair<int, int> create_slice_indices(float angle_start, float angle_increment);
	void update_score(float angle_increment);
public:
	Scanner_gestures();
	void parse_sensor_data(std::vector<float> range, float angle_start, float angle_increment, float poi_range, float poi_angle);
	void set_tracking(bool is_tracking);
	bool get_tracking();
	gest_e get_gesture(float threshold);
	std::pair<float, float> get_right_closest();
	std::pair<float, float> get_left_closest();
};
#endif
