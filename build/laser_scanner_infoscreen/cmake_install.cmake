# Install script for directory: /home/vadim/catkin_ws/src/laser_scanner_infoscreen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vadim/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen/msg" TYPE FILE FILES
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/biometrics_results.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_control.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/servo_feedback.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_control.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/stepper_feedback.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/gesture_call.msg"
    "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/msg/external_control.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen/srv" TYPE FILE FILES "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/srv/trackObjects.srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen/cmake" TYPE FILE FILES "/home/vadim/catkin_ws/build/laser_scanner_infoscreen/catkin_generated/installspace/laser_scanner_infoscreen-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vadim/catkin_ws/devel/include/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vadim/catkin_ws/devel/share/roseus/ros/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vadim/catkin_ws/devel/share/common-lisp/ros/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vadim/catkin_ws/devel/share/gennodejs/ros/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/vadim/catkin_ws/devel/lib/python2.7/dist-packages/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/vadim/catkin_ws/devel/lib/python2.7/dist-packages/laser_scanner_infoscreen")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vadim/catkin_ws/build/laser_scanner_infoscreen/catkin_generated/installspace/laser_scanner_infoscreen.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen/cmake" TYPE FILE FILES "/home/vadim/catkin_ws/build/laser_scanner_infoscreen/catkin_generated/installspace/laser_scanner_infoscreen-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen/cmake" TYPE FILE FILES
    "/home/vadim/catkin_ws/build/laser_scanner_infoscreen/catkin_generated/installspace/laser_scanner_infoscreenConfig.cmake"
    "/home/vadim/catkin_ws/build/laser_scanner_infoscreen/catkin_generated/installspace/laser_scanner_infoscreenConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/laser_scanner_infoscreen" TYPE FILE FILES "/home/vadim/catkin_ws/src/laser_scanner_infoscreen/package.xml")
endif()

