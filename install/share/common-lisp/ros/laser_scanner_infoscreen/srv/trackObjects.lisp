; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-srv)


;//! \htmlinclude trackObjects-request.msg.html

(cl:defclass <trackObjects-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0))
)

(cl:defclass trackObjects-request (<trackObjects-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trackObjects-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trackObjects-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-srv:<trackObjects-request> is deprecated: use laser_scanner_infoscreen-srv:trackObjects-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <trackObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:a-val is deprecated.  Use laser_scanner_infoscreen-srv:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trackObjects-request>) ostream)
  "Serializes a message object of type '<trackObjects-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trackObjects-request>) istream)
  "Deserializes a message object of type '<trackObjects-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-single-float-bits bits)))
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
  "fc0fbe0c395760faa36f1f99eb1a88b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trackObjects-request)))
  "Returns md5sum for a message object of type 'trackObjects-request"
  "fc0fbe0c395760faa36f1f99eb1a88b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trackObjects-request>)))
  "Returns full string definition for message of type '<trackObjects-request>"
  (cl:format cl:nil "float32 a~%~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trackObjects-request)))
  "Returns full string definition for message of type 'trackObjects-request"
  (cl:format cl:nil "float32 a~%~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trackObjects-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trackObjects-request>))
  "Converts a ROS message object to a list"
  (cl:list 'trackObjects-request
    (cl:cons ':a (a msg))
))
;//! \htmlinclude trackObjects-response.msg.html

(cl:defclass <trackObjects-response> (roslisp-msg-protocol:ros-message)
  ((b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0))
)

(cl:defclass trackObjects-response (<trackObjects-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trackObjects-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trackObjects-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-srv:<trackObjects-response> is deprecated: use laser_scanner_infoscreen-srv:trackObjects-response instead.")))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <trackObjects-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-srv:b-val is deprecated.  Use laser_scanner_infoscreen-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trackObjects-response>) ostream)
  "Serializes a message object of type '<trackObjects-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trackObjects-response>) istream)
  "Deserializes a message object of type '<trackObjects-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-single-float-bits bits)))
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
  "fc0fbe0c395760faa36f1f99eb1a88b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trackObjects-response)))
  "Returns md5sum for a message object of type 'trackObjects-response"
  "fc0fbe0c395760faa36f1f99eb1a88b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trackObjects-response>)))
  "Returns full string definition for message of type '<trackObjects-response>"
  (cl:format cl:nil "float32 b~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trackObjects-response)))
  "Returns full string definition for message of type 'trackObjects-response"
  (cl:format cl:nil "float32 b~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trackObjects-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trackObjects-response>))
  "Converts a ROS message object to a list"
  (cl:list 'trackObjects-response
    (cl:cons ':b (b msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'trackObjects)))
  'trackObjects-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'trackObjects)))
  'trackObjects-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trackObjects)))
  "Returns string type for a service object of type '<trackObjects>"
  "laser_scanner_infoscreen/trackObjects")