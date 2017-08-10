#ifndef LASER_OBJECTS_H
#define LASER_OBJECTS_H
#include <armadillo>
class laser_object_t
{
bool is_mobile;
std::pair<float, float> pos_centerofmass;
std::pair<float, float> vel_centerofmass;
float immobile_time;
ros::Time last_active;
arma::fmat X, P, K;
bool test_mobile();
public:
	laser_object_t(std::pair<float, float> pos_com,
	               std::pair<float, float> vel_com);
	float distance(std::pair<float,float> coords_to);
	ros::Time get_last_active();
	std::pair<float, float> get_pos_centerofmass();
	std::pair<float, float> get_vel_centerofmass();
	bool get_is_mobile();
	~laser_object_t();
	void run_kalman_filter(std::pair<float,float> new_pos, float dt);
};

class laser_objects
{
private:
	float dt;
	std::vector<laser_object_t> laser_object_repository;
public:
	void update(std::pair<float, float> pos_centerofmass);
	std::vector<float> get_mobiles_x();
	std::vector<float> get_mobiles_y();
	std::vector<float> get_statics_x();
	std::vector<float> get_statics_y();
	void update_repository();
	laser_objects(float scanner_dt);
	~laser_objects();
// std::vector<float> get_mobiles_dir()
// {
//
// }
//
// std::vector<float> get_mobiles_spd()
// {
//
// }
};
#endif /* end of include guard: LASER_OBJECTS_H */
