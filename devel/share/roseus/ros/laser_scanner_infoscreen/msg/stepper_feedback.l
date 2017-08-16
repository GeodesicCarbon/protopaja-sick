;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::stepper_feedback)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'stepper_feedback (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::STEPPER_FEEDBACK")
  (make-package "LASER_SCANNER_INFOSCREEN::STEPPER_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude stepper_feedback.msg.html


(defclass laser_scanner_infoscreen::stepper_feedback
  :super ros::object
  :slots (_screen_angle ))

(defmethod laser_scanner_infoscreen::stepper_feedback
  (:init
   (&key
    ((:screen_angle __screen_angle) 0.0)
    )
   (send-super :init)
   (setq _screen_angle (float __screen_angle))
   self)
  (:screen_angle
   (&optional __screen_angle)
   (if __screen_angle (setq _screen_angle __screen_angle)) _screen_angle)
  (:serialization-length
   ()
   (+
    ;; float32 _screen_angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _screen_angle
       (sys::poke _screen_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _screen_angle
     (setq _screen_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::stepper_feedback :md5sum-) "400631f2b01dbd17dd32daf8906e9197")
(setf (get laser_scanner_infoscreen::stepper_feedback :datatype-) "laser_scanner_infoscreen/stepper_feedback")
(setf (get laser_scanner_infoscreen::stepper_feedback :definition-)
      "float32 screen_angle
")



(provide :laser_scanner_infoscreen/stepper_feedback "400631f2b01dbd17dd32daf8906e9197")


