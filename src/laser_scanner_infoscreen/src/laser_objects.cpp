

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
/*! \file laser_objects.cpp
* \brief Implementation of object tracking
*
* Tracks and sorts objects into mobiles and statics from input given by laser_objects_server.cpp.
* Tracking is achieved with linear Kalman filter. Contains implementation for classes laser_object_t
* and laser_objects. 
*/
/*!
 *  \addtogroup laser_object_t
 *  @{
 */
using namespace arma;
/*! \def immobile_timeout 
Time in seconds before object is considered immobile.
*/
#define immobile_timeout 5.0f
/*! \def immobile_threshold 
Speed in m/s after which object is evaluated as moving.
*/
#define immobile_threshold 1.0f
/*! @} End of Doxygen Groups*/
/*!
 *  \addtogroup laser_object_s
 *  @{
 */
//! \def CULLING_TIME
//! Inactive time in seconds after which object is culled from the repository 
#define CULLING_TIME 5
//! \def object_threshold
//! Cartesian distance between points before they are considered same object.
#define object_threshold 0.4
/*! @} End of Doxygen Groups*/

/*!
 *  \addtogroup laser_object_t
 *  @{
 */
//! Prediction gaussian noise aka covariance matrix.
fmat Q  = { {0.1f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.1f, 0.0f, 0.0f},
            {0.0f, 0.0f, 1.0f, 0.0f}, //TODO:change real values
            {0.0f, 0.0f, 0.0f, 1.0f}  };
//! Measumerement accuracy matrix.
static fmat R = fmat(4,4).eye() * 1.2f;
//! Measumerement covariance matrix.
static fmat H = fmat(4,4).eye() * 1.0f;
// static fmat H = { {1.0f, 0.0f, 0.0f, 0.0f},
            // {0.0f, 1.0f, 0.0f, 0.0f} };
//! Model matrix.
static fmat F = fmat(4,4).eye();


/*! Constructor
\brief Construct a new laser_object_t from postion and velocti pair.

\param pos_com a <x,y> position vector of the object's center of mass.
\param pos_com a <v_x,v_y> velocity vector of the object's center of mass.
*/
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

/*! Mobile test.
\brief test whether object has surpassed immobile threshold.
\return is the object mobile.
*/
bool laser_object_t::test_mobile() {
	if (immobile_time > immobile_timeout) {
		this->is_mobile = false;
		return false;
	} else {
		this->is_mobile = true;
		return true;
	}
}

/*! Distance.
\brief Calculates the Cartesian distance between coordinate pair and this object
\param coords_to A coordinate pair in <x,y> format.
\return distance to the coordinate pair
*/
float laser_object_t::distance(std::pair<float,float> coords_to) {
	return std::sqrt(std::pow(this->pos_centerofmass.first - coords_to.first,2) +
	                 std::pow(this->pos_centerofmass.second - coords_to.second,2));
}

/*! Update object
\brief runs Kalman filter on the object and new measurements.

Construct a column vector in the form of <x, y, v_x, v_y> and updates position
by the Kalman filter. Should smooth path and improve tracking.

\param new_pos A <x,y> coordinate pair to the new measured position.
\param dt time between measurements
*/
void laser_object_t::run_kalman_filter(std::pair<float,float> new_pos, float dt) {
	// populate observations matrix, velocity calculated differentially
	fmat Z = fmat({new_pos.first, new_pos.second,
	               (new_pos.first - this->pos_centerofmass.first)/dt,
	               (new_pos.second - this->pos_centerofmass.second)/dt}).t();
	// predict step
	//this->X.print("start X: ");
	this->X = F * this->X;
	this->P = (F * this->P) * F.t() +Q;
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

/*! Getter for variable is_mobile
\return is this object mobile
*/
bool laser_object_t::get_is_mobile(){
	return this->is_mobile;
}

/*! Getter for variable last_active
\return time this object was last active
*/
ros::Time laser_object_t::get_last_active() {
	return this->last_active;
}

/*! Getter for variable pos_centerofmass
\return <x,y> coordinate pair of the object's CoM.
*/
std::pair<float, float> laser_object_t::get_pos_centerofmass(){
	return this->pos_centerofmass;
}

/*! Getter for variable vel_centerofmass
\return <d_x,d_y> vector pair of the object's CoM velocity.
*/
std::pair<float, float> laser_object_t::get_vel_centerofmass(){
	return this->vel_centerofmass;
}
//! Destructor
laser_object_t::~laser_object_t(){
};
/*! @} End of Doxygen Groups*/
// class laser_objects implementation starts here

/*!
 *  \addtogroup laser_objects
 *  @{
 */
 /*! \brief Update a object's position and status or create new one.
 
 If object in repository is within object_threshold then updates its position
 and status. Otherwise creates new object.
 
 \param pos_centerofmass a <x,y> coordinate pair of some CoM.
 \sa track_objects_server
 */
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

/*! Getter for the all mobiles' x coordinate.
\return list of all mobile object's x coordinate
\sa laser_objects::get_mobiles_y
*/ 
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

/*! Getter for the all mobiles' y coordinate.
\return list of all mobile object's y coordinate
\sa laser_objects::get_mobiles_x
*/ 
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

/*! Getter for the all static's x coordinate.
\return list of all mobile object's x coordinate
\sa laser_objects::get_statics_y
*/ 
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

/*! Getter for the all static's y coordinate.
\return list of all mobile object's y coordinate
\sa laser_objects::get_statics_x
*/ 
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

/*! Updates repository 
\brief Culls old objects from repository.

Removes all objects that have been updated over CULLING_TIME seconds ago.
*/
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
	   //ROS_DEBUG("%s", s.c_str());
}

//! \todo: Implement get_mobiles_dir()
// std::vector<float> get_mobiles_dir()
// {
//
// }

//! \todo Implemetn get_mobiles_spd()
// std::vector<float> get_mobiles_spd()
// {
//
// }

/*! \brief Constructor. Completes F model matrix with time interval.

Since effect of of the velocity on the position depends on the time it takes to update,
parameter dt is used to complete the model.

\param dt time interval between updates.
*/
laser_objects::laser_objects(float scanner_dt) :
	dt(scanner_dt)
{
	F(0,2) = dt;
	F(1,3) = dt;
};
/*! @} End of Doxygen Groups*/