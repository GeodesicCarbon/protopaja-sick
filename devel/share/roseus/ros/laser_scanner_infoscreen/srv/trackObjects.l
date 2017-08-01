;; Auto-generated. Do not edit!


(when (boundp 'laser_scanner_infoscreen::trackObjects)
  (if (not (find-package "LASER_SCANNER_INFOSCREEN"))
    (make-package "LASER_SCANNER_INFOSCREEN"))
  (shadow 'trackObjects (find-package "LASER_SCANNER_INFOSCREEN")))
(unless (find-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTS")
  (make-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTS"))
(unless (find-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTSREQUEST")
  (make-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTSREQUEST"))
(unless (find-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTSRESPONSE")
  (make-package "LASER_SCANNER_INFOSCREEN::TRACKOBJECTSRESPONSE"))

(in-package "ROS")





(defclass laser_scanner_infoscreen::trackObjectsRequest
  :super ros::object
  :slots (_a ))

(defmethod laser_scanner_infoscreen::trackObjectsRequest
  (:init
   (&key
    ((:a __a) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; float32 _a
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass laser_scanner_infoscreen::trackObjectsResponse
  :super ros::object
  :slots (_b ))

(defmethod laser_scanner_infoscreen::trackObjectsResponse
  (:init
   (&key
    ((:b __b) 0.0)
    )
   (send-super :init)
   (setq _b (float __b))
   self)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; float32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass laser_scanner_infoscreen::trackObjects
  :super ros::object
  :slots ())

(setf (get laser_scanner_infoscreen::trackObjects :md5sum-) "fc0fbe0c395760faa36f1f99eb1a88b3")
(setf (get laser_scanner_infoscreen::trackObjects :datatype-) "laser_scanner_infoscreen/trackObjects")
(setf (get laser_scanner_infoscreen::trackObjects :request) laser_scanner_infoscreen::trackObjectsRequest)
(setf (get laser_scanner_infoscreen::trackObjects :response) laser_scanner_infoscreen::trackObjectsResponse)

(defmethod laser_scanner_infoscreen::trackObjectsRequest
  (:response () (instance laser_scanner_infoscreen::trackObjectsResponse :init)))

(setf (get laser_scanner_infoscreen::trackObjectsRequest :md5sum-) "fc0fbe0c395760faa36f1f99eb1a88b3")
(setf (get laser_scanner_infoscreen::trackObjectsRequest :datatype-) "laser_scanner_infoscreen/trackObjectsRequest")
(setf (get laser_scanner_infoscreen::trackObjectsRequest :definition-)
      "float32 a









---
float32 b








")

(setf (get laser_scanner_infoscreen::trackObjectsResponse :md5sum-) "fc0fbe0c395760faa36f1f99eb1a88b3")
(setf (get laser_scanner_infoscreen::trackObjectsResponse :datatype-) "laser_scanner_infoscreen/trackObjectsResponse")
(setf (get laser_scanner_infoscreen::trackObjectsResponse :definition-)
      "float32 a









---
float32 b








")



(provide :laser_scanner_infoscreen/trackObjects "fc0fbe0c395760faa36f1f99eb1a88b3")


