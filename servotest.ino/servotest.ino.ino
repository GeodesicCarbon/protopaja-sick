
#include <duration.h>
#include <msg.h>
#include <node_handle.h>
#include <publisher.h>
#include <service_client.h>
#include <service_server.h>
#include <subscriber.h>
#include <time.h>

#include <Servo.h>
Servo myservo;
int potpin = 0;
int pulse_len = 1000;
int dir = 1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  myservo.attach(10);
}

void loop() {
   //put your main code here, to run repeatedly:
  pulse_len = analogRead(potpin);
  
  pulse_len = map(pulse_len, 0, 1023, 0, 180);
//if (dir) {
//  pulse_len += 10;
//} else {
//  pulse_len -= 10;
//}
//if (pulse_len > 2100) {
//  dir = 0;
//}
//if (pulse_len < 900) {
//  dir = 1;
//}
  myservo.write(pulse_len);
  Serial.println(pulse_len);
  delay(10);
}
