; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude stepper_feedback.msg.html

(cl:defclass <stepper_feedback> (roslisp-msg-protocol:ros-message)
  ((screen_angle
    :reader screen_angle
    :initarg :screen_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass stepper_feedback (<stepper_feedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stepper_feedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stepper_feedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<stepper_feedback> is deprecated: use laser_scanner_infoscreen-msg:stepper_feedback instead.")))

(cl:ensure-generic-function 'screen_angle-val :lambda-list '(m))
(cl:defmethod screen_angle-val ((m <stepper_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:screen_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:screen_angle instead.")
  (screen_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stepper_feedback>) ostream)
  "Serializes a message object of type '<stepper_feedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'screen_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stepper_feedback>) istream)
  "Deserializes a message object of type '<stepper_feedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'screen_angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stepper_feedback>)))
  "Returns string type for a message object of type '<stepper_feedback>"
  "laser_scanner_infoscreen/stepper_feedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stepper_feedback)))
  "Returns string type for a message object of type 'stepper_feedback"
  "laser_scanner_infoscreen/stepper_feedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stepper_feedback>)))
  "Returns md5sum for a message object of type '<stepper_feedback>"
  "400631f2b01dbd17dd32daf8906e9197")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stepper_feedback)))
  "Returns md5sum for a message object of type 'stepper_feedback"
  "400631f2b01dbd17dd32daf8906e9197")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stepper_feedback>)))
  "Returns full string definition for message of type '<stepper_feedback>"
  (cl:format cl:nil "float32 screen_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stepper_feedback)))
  "Returns full string definition for message of type 'stepper_feedback"
  (cl:format cl:nil "float32 screen_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stepper_feedback>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stepper_feedback>))
  "Converts a ROS message object to a list"
  (cl:list 'stepper_feedback
    (cl:cons ':screen_angle (screen_angle msg))
))
