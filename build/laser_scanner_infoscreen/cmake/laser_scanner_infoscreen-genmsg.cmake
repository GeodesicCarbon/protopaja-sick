# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "laser_scanner_infoscreen: 8 messages, 1 services")

set(MSG_I_FLAGS "-Ilaser_scanner_infoscreen:/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg;-Isensor_msgs:/opt/ros/lunar/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/lunar/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/lunar/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(laser_scanner_infoscreen_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" ""
)

get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_custom_target(_laser_scanner_infoscreen_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_scanner_infoscreen" "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Services
_generate_srv_cpp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Module File
_generate_module_cpp(laser_scanner_infoscreen
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(laser_scanner_infoscreen_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(laser_scanner_infoscreen_generate_messages laser_scanner_infoscreen_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_cpp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_scanner_infoscreen_gencpp)
add_dependencies(laser_scanner_infoscreen_gencpp laser_scanner_infoscreen_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_scanner_infoscreen_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Services
_generate_srv_eus(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Module File
_generate_module_eus(laser_scanner_infoscreen
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(laser_scanner_infoscreen_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(laser_scanner_infoscreen_generate_messages laser_scanner_infoscreen_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_eus _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_scanner_infoscreen_geneus)
add_dependencies(laser_scanner_infoscreen_geneus laser_scanner_infoscreen_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_scanner_infoscreen_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Services
_generate_srv_lisp(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Module File
_generate_module_lisp(laser_scanner_infoscreen
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(laser_scanner_infoscreen_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(laser_scanner_infoscreen_generate_messages laser_scanner_infoscreen_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_lisp _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_scanner_infoscreen_genlisp)
add_dependencies(laser_scanner_infoscreen_genlisp laser_scanner_infoscreen_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_scanner_infoscreen_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Services
_generate_srv_nodejs(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Module File
_generate_module_nodejs(laser_scanner_infoscreen
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(laser_scanner_infoscreen_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(laser_scanner_infoscreen_generate_messages laser_scanner_infoscreen_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_scanner_infoscreen_gennodejs)
add_dependencies(laser_scanner_infoscreen_gennodejs laser_scanner_infoscreen_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_scanner_infoscreen_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)
_generate_msg_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Services
_generate_srv_py(laser_scanner_infoscreen
  "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
)

### Generating Module File
_generate_module_py(laser_scanner_infoscreen
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(laser_scanner_infoscreen_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(laser_scanner_infoscreen_generate_messages laser_scanner_infoscreen_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv" NAME_WE)
add_dependencies(laser_scanner_infoscreen_generate_messages_py _laser_scanner_infoscreen_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_scanner_infoscreen_genpy)
add_dependencies(laser_scanner_infoscreen_genpy laser_scanner_infoscreen_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_scanner_infoscreen_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_scanner_infoscreen
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(laser_scanner_infoscreen_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_scanner_infoscreen
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(laser_scanner_infoscreen_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_scanner_infoscreen
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(laser_scanner_infoscreen_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_scanner_infoscreen
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(laser_scanner_infoscreen_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_scanner_infoscreen
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(laser_scanner_infoscreen_generate_messages_py sensor_msgs_generate_messages_py)
endif()
