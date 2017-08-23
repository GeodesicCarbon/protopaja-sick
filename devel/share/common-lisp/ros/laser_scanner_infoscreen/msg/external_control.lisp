; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude external_control.msg.html

(cl:defclass <external_control> (roslisp-msg-protocol:ros-message)
  ((zoom_level
    :reader zoom_level
    :initarg :zoom_level
    :type cl:fixnum
    :initform 0)
   (area_active
    :reader area_active
    :initarg :area_active
    :type cl:fixnum
    :initform 0)
   (gesture
    :reader gesture
    :initarg :gesture
    :type cl:fixnum
    :initform 0))
)

(cl:defclass external_control (<external_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <external_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'external_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<external_control> is deprecated: use laser_scanner_infoscreen-msg:external_control instead.")))

(cl:ensure-generic-function 'zoom_level-val :lambda-list '(m))
(cl:defmethod zoom_level-val ((m <external_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:zoom_level-val is deprecated.  Use laser_scanner_infoscreen-msg:zoom_level instead.")
  (zoom_level m))

(cl:ensure-generic-function 'area_active-val :lambda-list '(m))
(cl:defmethod area_active-val ((m <external_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:area_active-val is deprecated.  Use laser_scanner_infoscreen-msg:area_active instead.")
  (area_active m))

(cl:ensure-generic-function 'gesture-val :lambda-list '(m))
(cl:defmethod gesture-val ((m <external_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:gesture-val is deprecated.  Use laser_scanner_infoscreen-msg:gesture instead.")
  (gesture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <external_control>) ostream)
  "Serializes a message object of type '<external_control>"
  (cl:let* ((signed (cl:slot-value msg 'zoom_level)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'area_active)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gesture)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <external_control>) istream)
  "Deserializes a message object of type '<external_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'zoom_level) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'area_active) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gesture) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<external_control>)))
  "Returns string type for a message object of type '<external_control>"
  "laser_scanner_infoscreen/external_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'external_control)))
  "Returns string type for a message object of type 'external_control"
  "laser_scanner_infoscreen/external_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<external_control>)))
  "Returns md5sum for a message object of type '<external_control>"
  "c278a2cd5011b0416a9f6f215c70966a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'external_control)))
  "Returns md5sum for a message object of type 'external_control"
  "c278a2cd5011b0416a9f6f215c70966a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<external_control>)))
  "Returns full string definition for message of type '<external_control>"
  (cl:format cl:nil "int16 zoom_level~%int16 area_active~%int16 gesture~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'external_control)))
  "Returns full string definition for message of type 'external_control"
  (cl:format cl:nil "int16 zoom_level~%int16 area_active~%int16 gesture~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <external_control>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <external_control>))
  "Converts a ROS message object to a list"
  (cl:list 'external_control
    (cl:cons ':zoom_level (zoom_level msg))
    (cl:cons ':area_active (area_active msg))
    (cl:cons ':gesture (gesture msg))
))
