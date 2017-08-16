; Auto-generated. Do not edit!


(cl:in-package laser_scanner_infoscreen-msg)


;//! \htmlinclude biometrics_results.msg.html

(cl:defclass <biometrics_results> (roslisp-msg-protocol:ros-message)
  ((height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass biometrics_results (<biometrics_results>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <biometrics_results>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'biometrics_results)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_scanner_infoscreen-msg:<biometrics_results> is deprecated: use laser_scanner_infoscreen-msg:biometrics_results instead.")))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <biometrics_results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:height-val is deprecated.  Use laser_scanner_infoscreen-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <biometrics_results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_scanner_infoscreen-msg:id-val is deprecated.  Use laser_scanner_infoscreen-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <biometrics_results>) ostream)
  "Serializes a message object of type '<biometrics_results>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <biometrics_results>) istream)
  "Deserializes a message object of type '<biometrics_results>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<biometrics_results>)))
  "Returns string type for a message object of type '<biometrics_results>"
  "laser_scanner_infoscreen/biometrics_results")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'biometrics_results)))
  "Returns string type for a message object of type 'biometrics_results"
  "laser_scanner_infoscreen/biometrics_results")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<biometrics_results>)))
  "Returns md5sum for a message object of type '<biometrics_results>"
  "9f017109b7d68d9d6d6a58a73de45be6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'biometrics_results)))
  "Returns md5sum for a message object of type 'biometrics_results"
  "9f017109b7d68d9d6d6a58a73de45be6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<biometrics_results>)))
  "Returns full string definition for message of type '<biometrics_results>"
  (cl:format cl:nil "float32 height~%int16 id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'biometrics_results)))
  "Returns full string definition for message of type 'biometrics_results"
  (cl:format cl:nil "float32 height~%int16 id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <biometrics_results>))
  (cl:+ 0
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <biometrics_results>))
  "Converts a ROS message object to a list"
  (cl:list 'biometrics_results
    (cl:cons ':height (height msg))
    (cl:cons ':id (id msg))
))
