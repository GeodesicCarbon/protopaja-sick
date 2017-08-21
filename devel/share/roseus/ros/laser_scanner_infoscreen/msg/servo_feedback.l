;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::servo_feedback)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'servo_feedback (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::SERVO_FEEDBACK")
  (make-package "LASER_SCANNER_INFOSCREEN::SERVO_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude servo_feedback.msg.html


(defclass laser_scanner_infoscreen::servo_feedback
  :super ros::object
  :slots (_servo_angle ))

(defmethod laser_scanner_infoscreen::servo_feedback
  (:init
   (&key
    ((:servo_angle __servo_angle) 0)
    )
   (send-super :init)
   (setq _servo_angle (round __servo_angle))
   self)
  (:servo_angle
   (&optional __servo_angle)
   (if __servo_angle (setq _servo_angle __servo_angle)) _servo_angle)
  (:serialization-length
   ()
   (+
    ;; int16 _servo_angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _servo_angle
       (write-word _servo_angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _servo_angle
     (setq _servo_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::servo_feedback :md5sum-) "0222859f8ba1a8cb50469304425de862")
(setf (get laser_scanner_infoscreen::servo_feedback :datatype-) "laser_scanner_infoscreen/servo_feedback")
(setf (get laser_scanner_infoscreen::servo_feedback :definition-)
      "int16 servo_angle

")



(provide :laser_scanner_infoscreen/servo_feedback "0222859f8ba1a8cb50469304425de862")


