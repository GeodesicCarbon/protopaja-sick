; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-srv)


;//! \htmlinclude trackObjects-request.msg.html

(cl:defclass <trackObjects-request> (roslisp-msg-protocol:ros-message)
  ((angle_min
    :reader angle_min
    :initarg :angle_min
    :type cl:float
    :initform 0.0)
   (angle_max
    :reader angle_max
    :initarg :angle_max
    :type cl:float
    :initform 0.0)
   (angle_increment
    :reader angle_increment
    :initarg :angle_increment
    :type cl:float
    :initform 0.0)
   (time_increment
    :reader time_increment
    :initarg :time_increment
    :type cl:float
    :initform 0.0)
   (scan_time
    :reader scan_time
    :initarg :scan_time
    :type cl:float
    :initform 0.0)
   (ranges
    :reader ranges
    :initarg :ranges
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass trackObjects-request (<trackObjects-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trackObjects-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trackObjects-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-srv:<trackObjects-request> is deprecated: use laser_scanner_infoscreen-srv:trackObjects-request instead.")))

(cl:ensure-generic-function 'angle_min-val :lambda-list '(m))
(cl:defmethod angle_min-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:angle_min-val is deprecated.  Use laser_scanner_infoscreen-srv:angle_min instead.")
  (angle_min m))

(cl:ensure-generic-function 'angle_max-val :lambda-list '(m))
(cl:defmethod angle_max-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:angle_max-val is deprecated.  Use laser_scanner_infoscreen-srv:angle_max instead.")
  (angle_max m))

(cl:ensure-generic-function 'angle_increment-val :lambda-list '(m))
(cl:defmethod angle_increment-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:angle_increment-val is deprecated.  Use laser_scanner_infoscreen-srv:angle_increment instead.")
  (angle_increment m))

(cl:ensure-generic-function 'time_increment-val :lambda-list '(m))
(cl:defmethod time_increment-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:time_increment-val is deprecated.  Use laser_scanner_infoscreen-srv:time_increment instead.")
  (time_increment m))

(cl:ensure-generic-function 'scan_time-val :lambda-list '(m))
(cl:defmethod scan_time-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:scan_time-val is deprecated.  Use laser_scanner_infoscreen-srv:scan_time instead.")
  (scan_time m))

(cl:ensure-generic-function 'ranges-val :lambda-list '(m))
(cl:defmethod ranges-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:ranges-val is deprecated.  Use laser_scanner_infoscreen-srv:ranges instead.")
  (ranges m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trackObjects-request>) ostream)
  "Serializes a message object of type '<trackObjects-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_increment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time_increment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'scan_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ranges))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'ranges))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trackObjects-request>) istream)
  "Deserializes a message object of type '<trackObjects-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_max) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_increment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_increment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scan_time) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ranges) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ranges)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trackObjects-request>)))
  "Returns string type for a service object of type '<trackObjects-request>"
  "laser_scanner_infoscreen/trackObjectsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trackObjects-request)))
  "Returns string type for a service object of type 'trackObjects-request"
  "laser_scanner_infoscreen/trackObjectsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trackObjects-request>)))
  "Returns md5sum for a message object of type '<trackObjects-request>"
  "78b943e796437bdf7a8b6d34c2700469")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trackObjects-request)))
  "Returns md5sum for a message object of type 'trackObjects-request"
  "78b943e796437bdf7a8b6d34c2700469")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trackObjects-request>)))
  "Returns full string definition for message of type '<trackObjects-request>"
  (cl:format cl:nil "~%float32 angle_min~%float32 angle_max~%float32 angle_increment~%~%float32 time_increment~%float32 scan_time~%~%float32[] ranges~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trackObjects-request)))
  "Returns full string definition for message of type 'trackObjects-request"
  (cl:format cl:nil "~%float32 angle_min~%float32 angle_max~%float32 angle_increment~%~%float32 time_increment~%float32 scan_time~%~%float32[] ranges~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trackObjects-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ranges) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trackObjects-request>))
  "Converts a ROS message object to a list"
  (cl:list 'trackObjects-request
    (cl:cons ':angle_min (angle_min msg))
    (cl:cons ':angle_max (angle_max msg))
    (cl:cons ':angle_increment (angle_increment msg))
    (cl:cons ':time_increment (time_increment msg))
    (cl:cons ':scan_time (scan_time msg))
    (cl:cons ':ranges (ranges msg))
))
;//! \htmlinclude trackObjects-response.msg.html

(cl:defclass <trackObjects-response> (roslisp-msg-protocol:ros-message)
  ((mobiles_x
    :reader mobiles_x
    :initarg :mobiles_x
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (mobiles_y
    :reader mobiles_y
    :initarg :mobiles_y
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass trackObjects-response (<trackObjects-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trackObjects-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trackObjects-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-srv:<trackObjects-response> is deprecated: use laser_scanner_infoscreen-srv:trackObjects-response instead.")))

(cl:ensure-generic-function 'mobiles_x-val :lambda-list '(m))
(cl:defmethod mobiles_x-val ((m <trackObjects-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:mobiles_x-val is deprecated.  Use laser_scanner_infoscreen-srv:mobiles_x instead.")
  (mobiles_x m))

(cl:ensure-generic-function 'mobiles_y-val :lambda-list '(m))
(cl:defmethod mobiles_y-val ((m <trackObjects-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:mobiles_y-val is deprecated.  Use laser_scanner_infoscreen-srv:mobiles_y instead.")
  (mobiles_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trackObjects-response>) ostream)
  "Serializes a message object of type '<trackObjects-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mobiles_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'mobiles_x))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mobiles_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'mobiles_y))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trackObjects-response>) istream)
  "Deserializes a message object of type '<trackObjects-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mobiles_x) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mobiles_x)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mobiles_y) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mobiles_y)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trackObjects-response>)))
  "Returns string type for a service object of type '<trackObjects-response>"
  "laser_scanner_infoscreen/trackObjectsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trackObjects-response)))
  "Returns string type for a service object of type 'trackObjects-response"
  "laser_scanner_infoscreen/trackObjectsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trackObjects-response>)))
  "Returns md5sum for a message object of type '<trackObjects-response>"
  "78b943e796437bdf7a8b6d34c2700469")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trackObjects-response)))
  "Returns md5sum for a message object of type 'trackObjects-response"
  "78b943e796437bdf7a8b6d34c2700469")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trackObjects-response>)))
  "Returns full string definition for message of type '<trackObjects-response>"
  (cl:format cl:nil "float32[] mobiles_x~%float32[] mobiles_y~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trackObjects-response)))
  "Returns full string definition for message of type 'trackObjects-response"
  (cl:format cl:nil "float32[] mobiles_x~%float32[] mobiles_y~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trackObjects-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mobiles_x) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mobiles_y) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trackObjects-response>))
  "Converts a ROS message object to a list"
  (cl:list 'trackObjects-response
    (cl:cons ':mobiles_x (mobiles_x msg))
    (cl:cons ':mobiles_y (mobiles_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'trackObjects)))
  'trackObjects-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'trackObjects)))
  'trackObjects-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trackObjects)))
  "Returns string type for a service object of type '<trackObjects>"
  "laser_scanner_infoscreen/trackObjects")