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
    ((:servo_angle __servo_angle) 0.0)
    )
   (send-super :init)
   (setq _servo_angle (float __servo_angle))
   self)
  (:servo_angle
   (&optional __servo_angle)
   (if __servo_angle (setq _servo_angle __servo_angle)) _servo_angle)
  (:serialization-length
   ()
   (+
    ;; float32 _servo_angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _servo_angle
       (sys::poke _servo_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _servo_angle
     (setq _servo_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::servo_feedback :md5sum-) "82562d66b31318cfc6166f3f528b3869")
(setf (get laser_scanner_infoscreen::servo_feedback :datatype-) "laser_scanner_infoscreen/servo_feedback")
(setf (get laser_scanner_infoscreen::servo_feedback :definition-)
      "float32 servo_angle
")



(provide :laser_scanner_infoscreen/servo_feedback "82562d66b31318cfc6166f3f528b3869")


