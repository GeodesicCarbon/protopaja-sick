// Auto-generated. Do not edit!

// (in-package laser_scanner_infoscreen.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class servo_feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.servo_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('servo_angle')) {
        this.servo_angle = initObj.servo_angle
      }
      else {
        this.servo_angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type servo_feedback
    // Serialize message field [servo_angle]
    bufferOffset = _serializer.int16(obj.servo_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type servo_feedback
    let len;
    let data = new servo_feedback(null);
    // Deserialize message field [servo_angle]
    data.servo_angle = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_scanner_infoscreen/servo_feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0222859f8ba1a8cb50469304425de862';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 servo_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new servo_feedback(null);
    if (msg.servo_angle !== undefined) {
      resolved.servo_angle = msg.servo_angle;
    }
    else {
      resolved.servo_angle = 0
    }

    return resolved;
    }
};

module.exports = servo_feedback;
