#ifndef _ROS_infoscreen_arduino_messages_stepper_control_h
#define _ROS_infoscreen_arduino_messages_stepper_control_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace infoscreen_arduino_messages
{

  class stepper_control : public ros::Msg
  {
    public:
      typedef float _screen_angle_type;
      _screen_angle_type screen_angle;

    stepper_control():
      screen_angle(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_screen_angle;
      u_screen_angle.real = this->screen_angle;
      *(outbuffer + offset + 0) = (u_screen_angle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_screen_angle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_screen_angle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_screen_angle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->screen_angle);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_screen_angle;
      u_screen_angle.base = 0;
      u_screen_angle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_screen_angle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_screen_angle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_screen_angle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->screen_angle = u_screen_angle.real;
      offset += sizeof(this->screen_angle);
     return offset;
    }

    const char * getType(){ return "infoscreen_arduino_messages/stepper_control"; };
    const char * getMD5(){ return "400631f2b01dbd17dd32daf8906e9197"; };

  };

}
#endif