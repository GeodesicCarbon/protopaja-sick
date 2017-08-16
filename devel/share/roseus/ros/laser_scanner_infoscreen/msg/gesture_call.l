;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::gesture_call)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'gesture_call (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::GESTURE_CALL")
  (make-package "LASER_SCANNER_INFOSCREEN::GESTURE_CALL"))

(in-package "ROS")
;;//! \htmlinclude gesture_call.msg.html


(defclass laser_scanner_infoscreen::gesture_call
  :super ros::object
  :slots (_poi_range _poi_angle _is_tracking ))

(defmethod laser_scanner_infoscreen::gesture_call
  (:init
   (&key
    ((:poi_range __poi_range) 0.0)
    ((:poi_angle __poi_angle) 0.0)
    ((:is_tracking __is_tracking) 0)
    )
   (send-super :init)
   (setq _poi_range (float __poi_range))
   (setq _poi_angle (float __poi_angle))
   (setq _is_tracking (round __is_tracking))
   self)
  (:poi_range
   (&optional __poi_range)
   (if __poi_range (setq _poi_range __poi_range)) _poi_range)
  (:poi_angle
   (&optional __poi_angle)
   (if __poi_angle (setq _poi_angle __poi_angle)) _poi_angle)
  (:is_tracking
   (&optional __is_tracking)
   (if __is_tracking (setq _is_tracking __is_tracking)) _is_tracking)
  (:serialization-length
   ()
   (+
    ;; float32 _poi_range
    4
    ;; float32 _poi_angle
    4
    ;; int16 _is_tracking
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _poi_range
       (sys::poke _poi_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _poi_angle
       (sys::poke _poi_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _is_tracking
       (write-word _is_tracking s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _poi_range
     (setq _poi_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _poi_angle
     (setq _poi_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _is_tracking
     (setq _is_tracking (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::gesture_call :md5sum-) "5cf8d2a4addb6e231716f9b36fe788ce")
(setf (get laser_scanner_infoscreen::gesture_call :datatype-) "laser_scanner_infoscreen/gesture_call")
(setf (get laser_scanner_infoscreen::gesture_call :definition-)
      "float32 poi_range
float32 poi_angle
int16 is_tracking
")



(provide :laser_scanner_infoscreen/gesture_call "5cf8d2a4addb6e231716f9b36fe788ce")


