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
    ((:servo_angle __servo_angle) 0)
    ((:servo_speed __servo_speed) 0)
    )
   (send-super :init)
   (setq _servo_angle (round __servo_angle))
   (setq _servo_speed (round __servo_speed))
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
    ;; int16 _servo_angle
    2
    ;; int16 _servo_speed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _servo_angle
       (write-word _servo_angle s)
     ;; int16 _servo_speed
       (write-word _servo_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _servo_angle
     (setq _servo_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _servo_speed
     (setq _servo_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::servo_control :md5sum-) "c262244dcf1e02f10031616c618a6285")
(setf (get laser_scanner_infoscreen::servo_control :datatype-) "laser_scanner_infoscreen/servo_control")
(setf (get laser_scanner_infoscreen::servo_control :definition-)
      "int16 servo_angle
int16 servo_speed

")



(provide :laser_scanner_infoscreen/servo_control "c262244dcf1e02f10031616c618a6285")


