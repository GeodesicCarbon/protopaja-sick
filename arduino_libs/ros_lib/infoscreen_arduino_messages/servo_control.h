#ifndef _ROS_infoscreen_arduino_messages_servo_control_h
#define _ROS_infoscreen_arduino_messages_servo_control_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace infoscreen_arduino_messages
{

  class servo_control : public ros::Msg
  {
    public:
      typedef float _servo_angle_type;
      _servo_angle_type servo_angle;
      typedef float _servo_speed_type;
      _servo_speed_type servo_speed;

    servo_control():
      servo_angle(0),
      servo_speed(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_servo_angle;
      u_servo_angle.real = this->servo_angle;
      *(outbuffer + offset + 0) = (u_servo_angle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_servo_angle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_servo_angle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_servo_angle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->servo_angle);
      union {
        float real;
        uint32_t base;
      } u_servo_speed;
      u_servo_speed.real = this->servo_speed;
      *(outbuffer + offset + 0) = (u_servo_speed.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_servo_speed.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_servo_speed.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_servo_speed.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->servo_speed);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_servo_angle;
      u_servo_angle.base = 0;
      u_servo_angle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_servo_angle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_servo_angle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_servo_angle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->servo_angle = u_servo_angle.real;
      offset += sizeof(this->servo_angle);
      union {
        float real;
        uint32_t base;
      } u_servo_speed;
      u_servo_speed.base = 0;
      u_servo_speed.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_servo_speed.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_servo_speed.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_servo_speed.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->servo_speed = u_servo_speed.real;
      offset += sizeof(this->servo_speed);
     return offset;
    }

    const char * getType(){ return "infoscreen_arduino_messages/servo_control"; };
    const char * getMD5(){ return "d40719365f052936ed347d15907ec2c2"; };

  };

}
#endif