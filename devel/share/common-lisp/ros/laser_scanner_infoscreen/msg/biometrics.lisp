; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude biometrics.msg.html

(cl:defclass <biometrics> (roslisp-msg-protocol:ros-message)
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
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass biometrics (<biometrics>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <biometrics>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'biometrics)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<biometrics> is deprecated: use laser_scanner_infoscreen-msg:biometrics instead.")))

(cl:ensure-generic-function 'poi_range-val :lambda-list '(m))
(cl:defmethod poi_range-val ((m <biometrics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:poi_range-val is deprecated.  Use laser_scanner_infoscreen-msg:poi_range instead.")
  (poi_range m))

(cl:ensure-generic-function 'poi_angle-val :lambda-list '(m))
(cl:defmethod poi_angle-val ((m <biometrics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:poi_angle-val is deprecated.  Use laser_scanner_infoscreen-msg:poi_angle instead.")
  (poi_angle m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <biometrics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:id-val is deprecated.  Use laser_scanner_infoscreen-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <biometrics>) ostream)
  "Serializes a message object of type '<biometrics>"
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
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <biometrics>) istream)
  "Deserializes a message object of type '<biometrics>"
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
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<biometrics>)))
  "Returns string type for a message object of type '<biometrics>"
  "laser_scanner_infoscreen/biometrics")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'biometrics)))
  "Returns string type for a message object of type 'biometrics"
  "laser_scanner_infoscreen/biometrics")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<biometrics>)))
  "Returns md5sum for a message object of type '<biometrics>"
  "8719a8c69b6a97970947f537100edb07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'biometrics)))
  "Returns md5sum for a message object of type 'biometrics"
  "8719a8c69b6a97970947f537100edb07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<biometrics>)))
  "Returns full string definition for message of type '<biometrics>"
  (cl:format cl:nil "float32 poi_range~%float32 poi_angle~%int16 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'biometrics)))
  "Returns full string definition for message of type 'biometrics"
  (cl:format cl:nil "float32 poi_range~%float32 poi_angle~%int16 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <biometrics>))
  (cl:+ 0
     4
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <biometrics>))
  "Converts a ROS message object to a list"
  (cl:list 'biometrics
    (cl:cons ':poi_range (poi_range msg))
    (cl:cons ':poi_angle (poi_angle msg))
    (cl:cons ':id (id msg))
))
