;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::stepper_control)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'stepper_control (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::STEPPER_CONTROL")
  (make-package "LASER_SCANNER_INFOSCREEN::STEPPER_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude stepper_control.msg.html


(defclass laser_scanner_infoscreen::stepper_control
  :super ros::object
  :slots (_screen_angle ))

(defmethod laser_scanner_infoscreen::stepper_control
  (:init
   (&key
    ((:screen_angle __screen_angle) 0)
    )
   (send-super :init)
   (setq _screen_angle (round __screen_angle))
   self)
  (:screen_angle
   (&optional __screen_angle)
   (if __screen_angle (setq _screen_angle __screen_angle)) _screen_angle)
  (:serialization-length
   ()
   (+
    ;; int16 _screen_angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _screen_angle
       (write-word _screen_angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _screen_angle
     (setq _screen_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::stepper_control :md5sum-) "67c8601b38ae609d91115c61abc12a33")
(setf (get laser_scanner_infoscreen::stepper_control :datatype-) "laser_scanner_infoscreen/stepper_control")
(setf (get laser_scanner_infoscreen::stepper_control :definition-)
      "int16 screen_angle

")



(provide :laser_scanner_infoscreen/stepper_control "67c8601b38ae609d91115c61abc12a33")


