; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude servo_control.msg.html

(cl:defclass <servo_control> (roslisp-msg-protocol:ros-message)
  ((servo_angle
    :reader servo_angle
    :initarg :servo_angle
    :type cl:fixnum
    :initform 0)
   (servo_speed
    :reader servo_speed
    :initarg :servo_speed
    :type cl:fixnum
    :initform 0))
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
  (cl:let* ((signed (cl:slot-value msg 'servo_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'servo_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servo_control>) istream)
  "Deserializes a message object of type '<servo_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'servo_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'servo_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
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
  "c262244dcf1e02f10031616c618a6285")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servo_control)))
  "Returns md5sum for a message object of type 'servo_control"
  "c262244dcf1e02f10031616c618a6285")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servo_control>)))
  "Returns full string definition for message of type '<servo_control>"
  (cl:format cl:nil "int16 servo_angle~%int16 servo_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servo_control)))
  "Returns full string definition for message of type 'servo_control"
  (cl:format cl:nil "int16 servo_angle~%int16 servo_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servo_control>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servo_control>))
  "Converts a ROS message object to a list"
  (cl:list 'servo_control
    (cl:cons ':servo_angle (servo_angle msg))
    (cl:cons ':servo_speed (servo_speed msg))
))
