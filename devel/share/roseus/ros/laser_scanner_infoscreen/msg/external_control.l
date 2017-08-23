;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::external_control)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'external_control (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::EXTERNAL_CONTROL")
  (make-package "LASER_SCANNER_INFOSCREEN::EXTERNAL_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude external_control.msg.html


(defclass laser_scanner_infoscreen::external_control
  :super ros::object
  :slots (_zoom_level _area_active _gesture ))

(defmethod laser_scanner_infoscreen::external_control
  (:init
   (&key
    ((:zoom_level __zoom_level) 0)
    ((:area_active __area_active) 0)
    ((:gesture __gesture) 0)
    )
   (send-super :init)
   (setq _zoom_level (round __zoom_level))
   (setq _area_active (round __area_active))
   (setq _gesture (round __gesture))
   self)
  (:zoom_level
   (&optional __zoom_level)
   (if __zoom_level (setq _zoom_level __zoom_level)) _zoom_level)
  (:area_active
   (&optional __area_active)
   (if __area_active (setq _area_active __area_active)) _area_active)
  (:gesture
   (&optional __gesture)
   (if __gesture (setq _gesture __gesture)) _gesture)
  (:serialization-length
   ()
   (+
    ;; int16 _zoom_level
    2
    ;; int16 _area_active
    2
    ;; int16 _gesture
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _zoom_level
       (write-word _zoom_level s)
     ;; int16 _area_active
       (write-word _area_active s)
     ;; int16 _gesture
       (write-word _gesture s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _zoom_level
     (setq _zoom_level (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _area_active
     (setq _area_active (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gesture
     (setq _gesture (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::external_control :md5sum-) "c278a2cd5011b0416a9f6f215c70966a")
(setf (get laser_scanner_infoscreen::external_control :datatype-) "laser_scanner_infoscreen/external_control")
(setf (get laser_scanner_infoscreen::external_control :definition-)
      "int16 zoom_level
int16 area_active
int16 gesture
")



(provide :laser_scanner_infoscreen/external_control "c278a2cd5011b0416a9f6f215c70966a")


