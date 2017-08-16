// Generated by gencpp from file laser_scanner_infoscreen/servo_feedback.msg
// DO NOT EDIT!


#ifndef LASER_SCANNER_INFOSCREEN_MESSAGE_SERVO_FEEDBACK_H
#define LASER_SCANNER_INFOSCREEN_MESSAGE_SERVO_FEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace laser_scanner_infoscreen
{
template <class ContainerAllocator>
struct servo_feedback_
{
  typedef servo_feedback_<ContainerAllocator> Type;

  servo_feedback_()
    : servo_angle(0.0)  {
    }
  servo_feedback_(const ContainerAllocator& _alloc)
    : servo_angle(0.0)  {
  (void)_alloc;
    }



   typedef float _servo_angle_type;
  _servo_angle_type servo_angle;




  typedef boost::shared_ptr< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> const> ConstPtr;

}; // struct servo_feedback_

typedef ::laser_scanner_infoscreen::servo_feedback_<std::allocator<void> > servo_feedback;

typedef boost::shared_ptr< ::laser_scanner_infoscreen::servo_feedback > servo_feedbackPtr;
typedef boost::shared_ptr< ::laser_scanner_infoscreen::servo_feedback const> servo_feedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace laser_scanner_infoscreen

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/lunar/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/lunar/share/geometry_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/lunar/share/sensor_msgs/cmake/../msg'], 'laser_scanner_infoscreen': ['/home/proto/catkin_ws/src/laser_scanner_infoscreen/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "82562d66b31318cfc6166f3f528b3869";
  }

  static const char* value(const ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x82562d66b31318cfULL;
  static const uint64_t static_value2 = 0xc6166f3f528b3869ULL;
};

template<class ContainerAllocator>
struct DataType< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "laser_scanner_infoscreen/servo_feedback";
  }

  static const char* value(const ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 servo_angle\n\
";
  }

  static const char* value(const ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.servo_angle);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct servo_feedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::laser_scanner_infoscreen::servo_feedback_<ContainerAllocator>& v)
  {
    s << indent << "servo_angle: ";
    Printer<float>::stream(s, indent + "  ", v.servo_angle);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LASER_SCANNER_INFOSCREEN_MESSAGE_SERVO_FEEDBACK_H
