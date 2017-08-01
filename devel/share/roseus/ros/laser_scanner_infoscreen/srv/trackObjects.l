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
  :slots (_angle_min _angle_max _angle_increment _time_increment _scan_time _ranges ))

(defmethod laser_scanner_infoscreen::trackObjectsRequest
  (:init
   (&key
    ((:angle_min __angle_min) 0.0)
    ((:angle_max __angle_max) 0.0)
    ((:angle_increment __angle_increment) 0.0)
    ((:time_increment __time_increment) 0.0)
    ((:scan_time __scan_time) 0.0)
    ((:ranges __ranges) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _angle_min (float __angle_min))
   (setq _angle_max (float __angle_max))
   (setq _angle_increment (float __angle_increment))
   (setq _time_increment (float __time_increment))
   (setq _scan_time (float __scan_time))
   (setq _ranges __ranges)
   self)
  (:angle_min
   (&optional __angle_min)
   (if __angle_min (setq _angle_min __angle_min)) _angle_min)
  (:angle_max
   (&optional __angle_max)
   (if __angle_max (setq _angle_max __angle_max)) _angle_max)
  (:angle_increment
   (&optional __angle_increment)
   (if __angle_increment (setq _angle_increment __angle_increment)) _angle_increment)
  (:time_increment
   (&optional __time_increment)
   (if __time_increment (setq _time_increment __time_increment)) _time_increment)
  (:scan_time
   (&optional __scan_time)
   (if __scan_time (setq _scan_time __scan_time)) _scan_time)
  (:ranges
   (&optional __ranges)
   (if __ranges (setq _ranges __ranges)) _ranges)
  (:serialization-length
   ()
   (+
    ;; float32 _angle_min
    4
    ;; float32 _angle_max
    4
    ;; float32 _angle_increment
    4
    ;; float32 _time_increment
    4
    ;; float32 _scan_time
    4
    ;; float32[] _ranges
    (* 4    (length _ranges)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angle_min
       (sys::poke _angle_min (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle_max
       (sys::poke _angle_max (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle_increment
       (sys::poke _angle_increment (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _time_increment
       (sys::poke _time_increment (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _scan_time
       (sys::poke _scan_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _ranges
     (write-long (length _ranges) s)
     (dotimes (i (length _ranges))
       (sys::poke (elt _ranges i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angle_min
     (setq _angle_min (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle_max
     (setq _angle_max (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle_increment
     (setq _angle_increment (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _time_increment
     (setq _time_increment (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _scan_time
     (setq _scan_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _ranges
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ranges (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ranges i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass laser_scanner_infoscreen::trackObjectsResponse
  :super ros::object
  :slots (_mobiles_x _mobiles_y ))

(defmethod laser_scanner_infoscreen::trackObjectsResponse
  (:init
   (&key
    ((:mobiles_x __mobiles_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mobiles_y __mobiles_y) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _mobiles_x __mobiles_x)
   (setq _mobiles_y __mobiles_y)
   self)
  (:mobiles_x
   (&optional __mobiles_x)
   (if __mobiles_x (setq _mobiles_x __mobiles_x)) _mobiles_x)
  (:mobiles_y
   (&optional __mobiles_y)
   (if __mobiles_y (setq _mobiles_y __mobiles_y)) _mobiles_y)
  (:serialization-length
   ()
   (+
    ;; float32[] _mobiles_x
    (* 4    (length _mobiles_x)) 4
    ;; float32[] _mobiles_y
    (* 4    (length _mobiles_y)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _mobiles_x
     (write-long (length _mobiles_x) s)
     (dotimes (i (length _mobiles_x))
       (sys::poke (elt _mobiles_x i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _mobiles_y
     (write-long (length _mobiles_y) s)
     (dotimes (i (length _mobiles_y))
       (sys::poke (elt _mobiles_y i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _mobiles_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mobiles_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _mobiles_x i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _mobiles_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mobiles_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _mobiles_y i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass laser_scanner_infoscreen::trackObjects
  :super ros::object
  :slots ())

(setf (get laser_scanner_infoscreen::trackObjects :md5sum-) "78b943e796437bdf7a8b6d34c2700469")
(setf (get laser_scanner_infoscreen::trackObjects :datatype-) "laser_scanner_infoscreen/trackObjects")
(setf (get laser_scanner_infoscreen::trackObjects :request) laser_scanner_infoscreen::trackObjectsRequest)
(setf (get laser_scanner_infoscreen::trackObjects :response) laser_scanner_infoscreen::trackObjectsResponse)

(defmethod laser_scanner_infoscreen::trackObjectsRequest
  (:response () (instance laser_scanner_infoscreen::trackObjectsResponse :init)))

(setf (get laser_scanner_infoscreen::trackObjectsRequest :md5sum-) "78b943e796437bdf7a8b6d34c2700469")
(setf (get laser_scanner_infoscreen::trackObjectsRequest :datatype-) "laser_scanner_infoscreen/trackObjectsRequest")
(setf (get laser_scanner_infoscreen::trackObjectsRequest :definition-)
      "
float32 angle_min
float32 angle_max
float32 angle_increment

float32 time_increment
float32 scan_time

float32[] ranges
---
float32[] mobiles_x
float32[] mobiles_y






")

(setf (get laser_scanner_infoscreen::trackObjectsResponse :md5sum-) "78b943e796437bdf7a8b6d34c2700469")
(setf (get laser_scanner_infoscreen::trackObjectsResponse :datatype-) "laser_scanner_infoscreen/trackObjectsResponse")
(setf (get laser_scanner_infoscreen::trackObjectsResponse :definition-)
      "
float32 angle_min
float32 angle_max
float32 angle_increment

float32 time_increment
float32 scan_time

float32[] ranges
---
float32[] mobiles_x
float32[] mobiles_y






")



(provide :laser_scanner_infoscreen/trackObjects "78b943e796437bdf7a8b6d34c2700469")


