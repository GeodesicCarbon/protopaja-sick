;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::biometrics_results)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'biometrics_results (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::BIOMETRICS_RESULTS")
  (make-package "LASER_SCANNER_INFOSCREEN::BIOMETRICS_RESULTS"))

(in-package "ROS")
;;//! \htmlinclude biometrics_results.msg.html


(defclass laser_scanner_infoscreen::biometrics_results
  :super ros::object
  :slots (_height _id ))

(defmethod laser_scanner_infoscreen::biometrics_results
  (:init
   (&key
    ((:height __height) 0.0)
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _height (float __height))
   (setq _id (round __id))
   self)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; float32 _height
    4
    ;; int16 _id
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _id
       (write-word _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get laser_scanner_infoscreen::biometrics_results :md5sum-) "9f017109b7d68d9d6d6a58a73de45be6")
(setf (get laser_scanner_infoscreen::biometrics_results :datatype-) "laser_scanner_infoscreen/biometrics_results")
(setf (get laser_scanner_infoscreen::biometrics_results :definition-)
      "float32 height
int16 id
")



(provide :laser_scanner_infoscreen/biometrics_results "9f017109b7d68d9d6d6a58a73de45be6")


