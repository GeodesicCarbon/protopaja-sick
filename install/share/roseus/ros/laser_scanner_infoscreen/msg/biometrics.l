;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::biometrics)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'biometrics (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::BIOMETRICS")
  (make-package "LASER_SCANNER_INFOSCREEN::BIOMETRICS"))

(in-package "ROS")
;;//! \htmlinclude biometrics.msg.html


(defclass laser_scanner_infoscreen::biometrics
  :super ros::object
  :slots (_poi_range _poi_angle ))

(defmethod laser_scanner_infoscreen::biometrics
  (:init
   (&key
    ((:poi_range __poi_range) 0.0)
    ((:poi_angle __poi_angle) 0.0)
    )
   (send-super :init)
   (setq _poi_range (float __poi_range))
   (setq _poi_angle (float __poi_angle))
   self)
  (:poi_range
   (&optional __poi_range)
   (if __poi_range (setq _poi_range __poi_range)) _poi_range)
  (:poi_angle
   (&optional __poi_angle)
   (if __poi_angle (setq _poi_angle __poi_angle)) _poi_angle)
  (:serialization-length
   ()
   (+
    ;; float32 _poi_range
    4
    ;; float32 _poi_angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _poi_range
       (sys::poke _poi_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _poi_angle
       (sys::poke _poi_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _poi_range
     (setq _poi_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _poi_angle
     (setq _poi_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::biometrics :md5sum-) "843f8ba22bd226dde30b856c2778cd05")
(setf (get laser_scanner_infoscreen::biometrics :datatype-) "laser_scanner_infoscreen/biometrics")
(setf (get laser_scanner_infoscreen::biometrics :definition-)
      "float32 poi_range
float32 poi_angle

")



(provide :laser_scanner_infoscreen/biometrics "843f8ba22bd226dde30b856c2778cd05")


