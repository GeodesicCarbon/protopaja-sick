; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude gesture_call.msg.html

(cl:defclass <gesture_call> (roslisp-msg-protocol:ros-message)
  ((poi_range
    :reader poi_range
    :initarg :poi_range
    :type cl:float
    :initform 0.0)
   (poi_angle
    :reader poi_angle
    :initarg :poi_angle
    :type cl:float
    :initform 0.0)
   (is_tracking
    :reader is_tracking
    :initarg :is_tracking
    :type cl:fixnum
    :initform 0))
)

(cl:defclass gesture_call (<gesture_call>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gesture_call>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gesture_call)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<gesture_call> is deprecated: use laser_scanner_infoscreen-msg:gesture_call instead.")))

(cl:ensure-generic-function 'poi_range-val :lambda-list '(m))
(cl:defmethod poi_range-val ((m <gesture_call>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:poi_range-val is deprecated.  Use laser_scanner_infoscreen-msg:poi_range instead.")
  (poi_range m))

(cl:ensure-generic-function 'poi_angle-val :lambda-list '(m))
(cl:defmethod poi_angle-val ((m <gesture_call>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:poi_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:poi_angle instead.")
  (poi_angle m))

(cl:ensure-generic-function 'is_tracking-val :lambda-list '(m))
(cl:defmethod is_tracking-val ((m <gesture_call>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:is_tracking-val is deprecated.  Use laser_scanner_infoscreen-msg:is_tracking instead.")
  (is_tracking m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gesture_call>) ostream)
  "Serializes a message object of type '<gesture_call>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'poi_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'poi_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'is_tracking)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gesture_call>) istream)
  "Deserializes a message object of type '<gesture_call>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'poi_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'poi_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'is_tracking) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gesture_call>)))
  "Returns string type for a message object of type '<gesture_call>"
  "laser_scanner_infoscreen/gesture_call")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gesture_call)))
  "Returns string type for a message object of type 'gesture_call"
  "laser_scanner_infoscreen/gesture_call")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gesture_call>)))
  "Returns md5sum for a message object of type '<gesture_call>"
  "5cf8d2a4addb6e231716f9b36fe788ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gesture_call)))
  "Returns md5sum for a message object of type 'gesture_call"
  "5cf8d2a4addb6e231716f9b36fe788ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gesture_call>)))
  "Returns full string definition for message of type '<gesture_call>"
  (cl:format cl:nil "float32 poi_range~%float32 poi_angle~%int16 is_tracking~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gesture_call)))
  "Returns full string definition for message of type 'gesture_call"
  (cl:format cl:nil "float32 poi_range~%float32 poi_angle~%int16 is_tracking~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gesture_call>))
  (cl:+ 0
     4
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gesture_call>))
  "Converts a ROS message object to a list"
  (cl:list 'gesture_call
    (cl:cons ':poi_range (poi_range msg))
    (cl:cons ':poi_angle (poi_angle msg))
    (cl:cons ':is_tracking (is_tracking msg))
))
