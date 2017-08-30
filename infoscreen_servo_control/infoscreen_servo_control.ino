
#include "Arduino.h"

#include <Servo.h>

#define USE_USBCON
#include <ros.h>
#include <laser_scanner_infoscreen/servo_control.h>
#include <laser_scanner_infoscreen/servo_feedback.h>


ros::NodeHandle nh;
Servo myservo;
//int servo_speed = round(1000*5*M_PI/3);
int starting_angle = 0;
int new_angle = 0;
int angle_offset =  262;
int servo_start_us = 800;
int servo_end_us = 2300;
int servo_us = 1000;
unsigned long time_buffer = 300;
unsigned long servo_start_moving;
unsigned long time_complete;
int has_published = 1;

void servo_callback(const laser_scanner_infoscreen::servo_control& cmd_msg)
{
  int normalized_angle = cmd_msg.servo_angle + angle_offset;
  servo_us = map(normalized_angle, -1047, 524, 2000, 1000);
  int servo_move_time = abs(round(normalized_angle- starting_angle)*2000/cmd_msg.servo_speed);
  int normalized_us = constrain(servo_us, servo_start_us, servo_end_us);
  new_angle = map(normalized_us, 1000, 2000, -1047, 524);
  servo_start_moving = millis();
  time_complete = servo_start_moving + servo_move_time + time_buffer;
  has_published = 0;
  myservo.writeMicroseconds(normalized_us);
  
}
laser_scanner_infoscreen::servo_feedback servo_status;
ros::Subscriber<laser_scanner_infoscreen::servo_control> sub("servo_control", servo_callback);
ros::Publisher position_data("servo_position", &servo_status);

void setup() {
  Serial.begin(9600);
  myservo.attach(10);
  myservo.write(90);
  delay(500);

  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(position_data);
}

void loop() {
  if (millis() > time_complete && !has_published) {
    servo_status.servo_angle = new_angle;
    position_data.publish(&servo_status);
    starting_angle = new_angle;
    has_published = 1;
  }
  nh.spinOnce();
}

