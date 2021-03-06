// Generated by gencpp from file laser_scanner_infoscreen/gesture_call.msg
// DO NOT EDIT!


#ifndef LASER_SCANNER_INFOSCREEN_MESSAGE_GESTURE_CALL_H
#define LASER_SCANNER_INFOSCREEN_MESSAGE_GESTURE_CALL_H


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
struct gesture_call_
{
  typedef gesture_call_<ContainerAllocator> Type;

  gesture_call_()
    : poi_range(0.0)
    , poi_angle(0.0)
    , is_tracking(0)  {
    }
  gesture_call_(const ContainerAllocator& _alloc)
    : poi_range(0.0)
    , poi_angle(0.0)
    , is_tracking(0)  {
  (void)_alloc;
    }



   typedef float _poi_range_type;
  _poi_range_type poi_range;

   typedef float _poi_angle_type;
  _poi_angle_type poi_angle;

   typedef int16_t _is_tracking_type;
  _is_tracking_type is_tracking;




  typedef boost::shared_ptr< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> const> ConstPtr;

}; // struct gesture_call_

typedef ::laser_scanner_infoscreen::gesture_call_<std::allocator<void> > gesture_call;

typedef boost::shared_ptr< ::laser_scanner_infoscreen::gesture_call > gesture_callPtr;
typedef boost::shared_ptr< ::laser_scanner_infoscreen::gesture_call const> gesture_callConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5cf8d2a4addb6e231716f9b36fe788ce";
  }

  static const char* value(const ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5cf8d2a4addb6e23ULL;
  static const uint64_t static_value2 = 0x1716f9b36fe788ceULL;
};

template<class ContainerAllocator>
struct DataType< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
{
  static const char* value()
  {
    return "laser_scanner_infoscreen/gesture_call";
  }

  static const char* value(const ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 poi_range\n\
float32 poi_angle\n\
int16 is_tracking\n\
";
  }

  static const char* value(const ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.poi_range);
      stream.next(m.poi_angle);
      stream.next(m.is_tracking);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct gesture_call_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::laser_scanner_infoscreen::gesture_call_<ContainerAllocator>& v)
  {
    s << indent << "poi_range: ";
    Printer<float>::stream(s, indent + "  ", v.poi_range);
    s << indent << "poi_angle: ";
    Printer<float>::stream(s, indent + "  ", v.poi_angle);
    s << indent << "is_tracking: ";
    Printer<int16_t>::stream(s, indent + "  ", v.is_tracking);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LASER_SCANNER_INFOSCREEN_MESSAGE_GESTURE_CALL_H
