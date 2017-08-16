; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude servo_control.msg.html

(cl:defclass <servo_control> (roslisp-msg-protocol:ros-message)
  ((servo_angle
    :reader servo_angle
    :initarg :servo_angle
    :type cl:float
    :initform 0.0)
   (servo_speed
    :reader servo_speed
    :initarg :servo_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass servo_control (<servo_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servo_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servo_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<servo_control> is deprecated: use laser_scanner_infoscreen-msg:servo_control instead.")))

(cl:ensure-generic-function 'servo_angle-val :lambda-list '(m))
(cl:defmethod servo_angle-val ((m <servo_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:servo_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:servo_angle instead.")
  (servo_angle m))

(cl:ensure-generic-function 'servo_speed-val :lambda-list '(m))
(cl:defmethod servo_speed-val ((m <servo_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:servo_speed-val is deprecated.  Use laser_scanner_infoscreen-msg:servo_speed instead.")
  (servo_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servo_control>) ostream)
  "Serializes a message object of type '<servo_control>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'servo_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'servo_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servo_control>) istream)
  "Deserializes a message object of type '<servo_control>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'servo_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'servo_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servo_control>)))
  "Returns string type for a message object of type '<servo_control>"
  "laser_scanner_infoscreen/servo_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servo_control)))
  "Returns string type for a message object of type 'servo_control"
  "laser_scanner_infoscreen/servo_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servo_control>)))
  "Returns md5sum for a message object of type '<servo_control>"
  "d40719365f052936ed347d15907ec2c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servo_control)))
  "Returns md5sum for a message object of type 'servo_control"
  "d40719365f052936ed347d15907ec2c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servo_control>)))
  "Returns full string definition for message of type '<servo_control>"
  (cl:format cl:nil "float32 servo_angle~%float32 servo_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servo_control)))
  "Returns full string definition for message of type 'servo_control"
  (cl:format cl:nil "float32 servo_angle~%float32 servo_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servo_control>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servo_control>))
  "Converts a ROS message object to a list"
  (cl:list 'servo_control
    (cl:cons ':servo_angle (servo_angle msg))
    (cl:cons ':servo_speed (servo_speed msg))
))
