;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::servo_control)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'servo_control (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::SERVO_CONTROL")
  (make-package "LASER_SCANNER_INFOSCREEN::SERVO_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude servo_control.msg.html


(defclass laser_scanner_infoscreen::servo_control
  :super ros::object
  :slots (_servo_angle _servo_speed ))

(defmethod laser_scanner_infoscreen::servo_control
  (:init
   (&key
    ((:servo_angle __servo_angle) 0.0)
    ((:servo_speed __servo_speed) 0.0)
    )
   (send-super :init)
   (setq _servo_angle (float __servo_angle))
   (setq _servo_speed (float __servo_speed))
   self)
  (:servo_angle
   (&optional __servo_angle)
   (if __servo_angle (setq _servo_angle __servo_angle)) _servo_angle)
  (:servo_speed
   (&optional __servo_speed)
   (if __servo_speed (setq _servo_speed __servo_speed)) _servo_speed)
  (:serialization-length
   ()
   (+
    ;; float32 _servo_angle
    4
    ;; float32 _servo_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _servo_angle
       (sys::poke _servo_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _servo_speed
       (sys::poke _servo_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _servo_angle
     (setq _servo_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _servo_speed
     (setq _servo_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::servo_control :md5sum-) "d40719365f052936ed347d15907ec2c2")
(setf (get laser_scanner_infoscreen::servo_control :datatype-) "laser_scanner_infoscreen/servo_control")
(setf (get laser_scanner_infoscreen::servo_control :definition-)
      "float32 servo_angle
float32 servo_speed
")



(provide :laser_scanner_infoscreen/servo_control "d40719365f052936ed347d15907ec2c2")


