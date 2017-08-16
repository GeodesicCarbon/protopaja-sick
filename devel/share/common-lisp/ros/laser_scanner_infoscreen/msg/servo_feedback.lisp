; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude servo_feedback.msg.html

(cl:defclass <servo_feedback> (roslisp-msg-protocol:ros-message)
  ((servo_angle
    :reader servo_angle
    :initarg :servo_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass servo_feedback (<servo_feedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servo_feedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servo_feedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<servo_feedback> is deprecated: use laser_scanner_infoscreen-msg:servo_feedback instead.")))

(cl:ensure-generic-function 'servo_angle-val :lambda-list '(m))
(cl:defmethod servo_angle-val ((m <servo_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:servo_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:servo_angle instead.")
  (servo_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servo_feedback>) ostream)
  "Serializes a message object of type '<servo_feedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'servo_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servo_feedback>) istream)
  "Deserializes a message object of type '<servo_feedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'servo_angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servo_feedback>)))
  "Returns string type for a message object of type '<servo_feedback>"
  "laser_scanner_infoscreen/servo_feedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servo_feedback)))
  "Returns string type for a message object of type 'servo_feedback"
  "laser_scanner_infoscreen/servo_feedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servo_feedback>)))
  "Returns md5sum for a message object of type '<servo_feedback>"
  "82562d66b31318cfc6166f3f528b3869")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servo_feedback)))
  "Returns md5sum for a message object of type 'servo_feedback"
  "82562d66b31318cfc6166f3f528b3869")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servo_feedback>)))
  "Returns full string definition for message of type '<servo_feedback>"
  (cl:format cl:nil "float32 servo_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servo_feedback)))
  "Returns full string definition for message of type 'servo_feedback"
  (cl:format cl:nil "float32 servo_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servo_feedback>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servo_feedback>))
  "Converts a ROS message object to a list"
  (cl:list 'servo_feedback
    (cl:cons ':servo_angle (servo_angle msg))
))
