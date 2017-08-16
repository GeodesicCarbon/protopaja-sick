// Generated by gencpp from file laser_scanner_infoscreen/biometrics_results.msg
// DO NOT EDIT!


#ifndef LASER_SCANNER_INFOSCREEN_MESSAGE_BIOMETRICS_RESULTS_H
#define LASER_SCANNER_INFOSCREEN_MESSAGE_BIOMETRICS_RESULTS_H


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
struct biometrics_results_
{
  typedef biometrics_results_<ContainerAllocator> Type;

  biometrics_results_()
    : height(0.0)
    , id(0)  {
    }
  biometrics_results_(const ContainerAllocator& _alloc)
    : height(0.0)
    , id(0)  {
  (void)_alloc;
    }



   typedef float _height_type;
  _height_type height;

   typedef int16_t _id_type;
  _id_type id;




  typedef boost::shared_ptr< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> const> ConstPtr;

}; // struct biometrics_results_

typedef ::laser_scanner_infoscreen::biometrics_results_<std::allocator<void> > biometrics_results;

typedef boost::shared_ptr< ::laser_scanner_infoscreen::biometrics_results > biometrics_resultsPtr;
typedef boost::shared_ptr< ::laser_scanner_infoscreen::biometrics_results const> biometrics_resultsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9f017109b7d68d9d6d6a58a73de45be6";
  }

  static const char* value(const ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9f017109b7d68d9dULL;
  static const uint64_t static_value2 = 0x6d6a58a73de45be6ULL;
};

template<class ContainerAllocator>
struct DataType< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
{
  static const char* value()
  {
    return "laser_scanner_infoscreen/biometrics_results";
  }

  static const char* value(const ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 height\n\
int16 id\n\
";
  }

  static const char* value(const ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.height);
      stream.next(m.id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct biometrics_results_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::laser_scanner_infoscreen::biometrics_results_<ContainerAllocator>& v)
  {
    s << indent << "height: ";
    Printer<float>::stream(s, indent + "  ", v.height);
    s << indent << "id: ";
    Printer<int16_t>::stream(s, indent + "  ", v.id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LASER_SCANNER_INFOSCREEN_MESSAGE_BIOMETRICS_RESULTS_H
