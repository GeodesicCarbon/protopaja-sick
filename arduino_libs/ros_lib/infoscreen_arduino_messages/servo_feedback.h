#ifndef _ROS_infoscreen_arduino_messages_servo_feedback_h
#define _ROS_infoscreen_arduino_messages_servo_feedback_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace infoscreen_arduino_messages
{

  class servo_feedback : public ros::Msg
  {
    public:
      typedef float _servo_angle_type;
      _servo_angle_type servo_angle;

    servo_feedback():
      servo_angle(0)
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
     return offset;
    }

    const char * getType(){ return "infoscreen_arduino_messages/servo_feedback"; };
    const char * getMD5(){ return "82562d66b31318cfc6166f3f528b3869"; };

  };

}
#endif