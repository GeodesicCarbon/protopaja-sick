#include "Arduino.h"

#include <Servo.h>
#include <ros.h>
#include <servo_control.h>
#include <servo_feedback.h>
#include <cmath>

ros::NodeHandle nh;
Servo myservo;
int pulse_len = 1000;
float offset = M_PI/4;
unsigned long time_stamp_complete;
int last_angle = 3140/2;
int new_angle = last_angle;

void servo_callback(const infoscreen_arduino_messages::servo_control& cmd_msg)
{
  int normalized_angle = std::max(0,std::min(3140,std::roundf((msg.servo_angle - offset) * 1000)));
  int normalized_speed = std::roundf(msg.servo_speed*1000);
  int d_angle = last_angle - normalized_angle;
  pulse_len = map(normalized_angle, 0, 3140, 900, 2100);
  myservo.writeMillis(pulse_len);
  time_stamp_complete = millis() + d_angle*1000/normalized_speed + 200;
}

infoscreen_arduino_messages::servo_feedback servo_status;
ros::Subscriber<infoscreen_arduino_messages::servo_control> sub("servo_control", servo_callback);
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
  if (millis() > time_stamp_complete) {
    servo_status.servo_angle = new_angle /1000.0f;
    position_data.publish(&servo_status);
    last_angle = new_angle;
  }
  nh.spinOnce();
}

