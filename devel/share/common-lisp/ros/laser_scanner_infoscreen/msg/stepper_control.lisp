; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude stepper_control.msg.html

(cl:defclass <stepper_control> (roslisp-msg-protocol:ros-message)
  ((screen_angle
    :reader screen_angle
    :initarg :screen_angle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass stepper_control (<stepper_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stepper_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stepper_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<stepper_control> is deprecated: use laser_scanner_infoscreen-msg:stepper_control instead.")))

(cl:ensure-generic-function 'screen_angle-val :lambda-list '(m))
(cl:defmethod screen_angle-val ((m <stepper_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:screen_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:screen_angle instead.")
  (screen_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stepper_control>) ostream)
  "Serializes a message object of type '<stepper_control>"
  (cl:let* ((signed (cl:slot-value msg 'screen_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stepper_control>) istream)
  "Deserializes a message object of type '<stepper_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'screen_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stepper_control>)))
  "Returns string type for a message object of type '<stepper_control>"
  "laser_scanner_infoscreen/stepper_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stepper_control)))
  "Returns string type for a message object of type 'stepper_control"
  "laser_scanner_infoscreen/stepper_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stepper_control>)))
  "Returns md5sum for a message object of type '<stepper_control>"
  "67c8601b38ae609d91115c61abc12a33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stepper_control)))
  "Returns md5sum for a message object of type 'stepper_control"
  "67c8601b38ae609d91115c61abc12a33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stepper_control>)))
  "Returns full string definition for message of type '<stepper_control>"
  (cl:format cl:nil "int16 screen_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stepper_control)))
  "Returns full string definition for message of type 'stepper_control"
  (cl:format cl:nil "int16 screen_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stepper_control>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stepper_control>))
  "Converts a ROS message object to a list"
  (cl:list 'stepper_control
    (cl:cons ':screen_angle (screen_angle msg))
))
