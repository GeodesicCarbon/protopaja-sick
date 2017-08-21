#include "ros/ros.h"
#include <visualization_msgs/Marker.h>
#include <vector>
#include <cmath>
#include <utility>
#include "laser_objects.hpp"
#include <iostream>
#include <algorithm>
#include <string>
#include </usr/include/armadillo>

using namespace arma;

#define immobile_timeout 10.0f
#define object_threshold 0.4
#define immobile_threshold 100.0f
#define CULLING_TIME 5


static fmat Q = fmat(4,4).eye(); //TODO:change real values

static fmat R = fmat(4,4).eye() * 0.8;
static fmat H = fmat(4,4).eye() * 0.8;
static fmat F = fmat(4,4).eye();


laser_object_t::laser_object_t(std::pair<float, float> pos_com,
                               std::pair<float, float> vel_com) :
	is_mobile(false),
	pos_centerofmass(pos_com),
	vel_centerofmass(vel_com),
	immobile_time(0.0)
{
	X = fmat({pos_centerofmass.first, pos_centerofmass.second,
	          vel_centerofmass.first, vel_centerofmass.second}).t();
	P.eye(4,4);
	last_active = ros::Time::now();
};

bool laser_object_t::test_mobile() {
	if (immobile_time > immobile_timeout) {
		this->is_mobile = false;
		return false;
	} else {
		this->is_mobile = true;
		return true;
	}
}

float laser_object_t::distance(std::pair<float,float> coords_to) {
	return std::sqrt(std::pow(this->pos_centerofmass.first - coords_to.first,2) +
	                 std::pow(this->pos_centerofmass.second - coords_to.second,2));
}

void laser_object_t::run_kalman_filter(std::pair<float,float> new_pos, float dt) {
	// populate observations matrix, velocity calculated differentially
	fmat Z = fmat({new_pos.first, new_pos.second,
	               (new_pos.first - this->pos_centerofmass.first)/dt,
	               (new_pos.second - this->pos_centerofmass.second)/dt}).t();
	//Z.print("Z: ");
	// predict step
	//this->X.print("start X: ");
	this->X = F * this->X;
	this->P = (F * this->P) * F.t(); +Q;
	//this->X.print("predict X: ");

	// kalman gain
	this->K = this->P * H.t() * (H * this->P * H.t() + R).i();

	// update step

	this->X = this->X + this->K * (Z - H * this->X);
	this->P = this->P - K * H * this->P;
	//this->X.print("update X:");

	// update pairs
	this->pos_centerofmass.first = this->X(0,0);
	this->pos_centerofmass.second = this->X(1,0);
	this->vel_centerofmass.first = this->X(2,0);
	this->vel_centerofmass.second = this->X(3,0);

	// update attributes
	if(std::abs(this->vel_centerofmass.first) +
	   std::abs(this->vel_centerofmass.second) < immobile_threshold) {
		this->immobile_time = std::min(this->immobile_time + dt, 10.0f);
	} else {
		this->immobile_time = std::max(this->immobile_time - dt*10, 0.0f);
		this->is_mobile = true;
	}
	this->test_mobile();
	this->last_active = ros::Time::now();

}

bool laser_object_t::get_is_mobile(){
	return this->is_mobile;
}

ros::Time laser_object_t::get_last_active() {
	return this->last_active;
}
std::pair<float, float> laser_object_t::get_pos_centerofmass(){
	return this->pos_centerofmass;
}
std::pair<float, float> laser_object_t::get_vel_centerofmass(){
	return this->vel_centerofmass;
}
laser_object_t::~laser_object_t(){
};

// class laser_objects implementation starts here


void laser_objects::update(std::pair<float, float> pos_centerofmass)
{
	for (auto &laser_object : laser_object_repository) {
		if (laser_object.distance(pos_centerofmass) < object_threshold) {
			laser_object.run_kalman_filter(pos_centerofmass, dt);
			return;
		}
	}
	laser_object_t temp(pos_centerofmass, std::make_pair(0,0));
	laser_object_repository.push_back(temp);
}

std::vector<float> laser_objects::get_mobiles_x()
{
	std::vector<float> temp;
	for (auto laser_object : laser_object_repository) {
		if(laser_object.get_is_mobile()) {
			temp.push_back(laser_object.get_pos_centerofmass().first);
		}
	}
	return temp;
}
std::vector<float> laser_objects::get_mobiles_y()
{
	std::vector<float> temp;
	for (auto &laser_object : laser_object_repository) {
		if(laser_object.get_is_mobile()) {
			temp.push_back(laser_object.get_pos_centerofmass().second);
		}
	}
	return temp;
}
std::vector<float> laser_objects::get_statics_x()
{
	std::vector<float> temp;
	for (auto &laser_object : laser_object_repository) {
		if(!laser_object.get_is_mobile()) {
			temp.push_back(laser_object.get_pos_centerofmass().first);
		}
	}
	return temp;
}
std::vector<float> laser_objects::get_statics_y()
{
	std::vector<float> temp;
	for (auto &laser_object : laser_object_repository) {
		if(!laser_object.get_is_mobile()) {
			temp.push_back(laser_object.get_pos_centerofmass().second);
		}
	}
	return temp;
}

void laser_objects::update_repository() {
	//ROS_INFO("Objects before cull: %d",(int) this->laser_object_repository.size());
	laser_object_repository.erase(
	        std::remove_if(laser_object_repository.begin(), laser_object_repository.end(),
	                       [] (laser_object_t &laser_object){
	                               return (laser_object.get_last_active() + ros::Duration(CULLING_TIME)) < ros::Time::now();
			       }),
	        laser_object_repository.end());
	//ROS_INFO("Objects after cull: %d", (int)this->laser_object_repository.size());
	std::string s("Vel of mobiles: ");
	   char c[50];
	   for (auto laser_object : laser_object_repository) {
	   if(laser_object.get_is_mobile()) {
	    sprintf(c, " [%.2f %.2f], ", (float) laser_object.get_vel_centerofmass().first,(float) laser_object.get_vel_centerofmass().second);
	    s.append(c);
	   }
	   }
	   //ROS_INFO("%s", s.c_str());
}


// std::vector<float> get_mobiles_dir()
// {
//
// }

// std::vector<float> get_mobiles_spd()
// {
//
// }
laser_objects::laser_objects(float scanner_dt) :
	dt(scanner_dt)
{
	F(0,2) = dt/10;
	F(1,3) = dt/10;
};
