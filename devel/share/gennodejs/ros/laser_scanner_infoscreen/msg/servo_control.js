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

class servo_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.servo_angle = null;
      this.servo_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('servo_angle')) {
        this.servo_angle = initObj.servo_angle
      }
      else {
        this.servo_angle = 0.0;
      }
      if (initObj.hasOwnProperty('servo_speed')) {
        this.servo_speed = initObj.servo_speed
      }
      else {
        this.servo_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type servo_control
    // Serialize message field [servo_angle]
    bufferOffset = _serializer.float32(obj.servo_angle, buffer, bufferOffset);
    // Serialize message field [servo_speed]
    bufferOffset = _serializer.float32(obj.servo_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type servo_control
    let len;
    let data = new servo_control(null);
    // Deserialize message field [servo_angle]
    data.servo_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [servo_speed]
    data.servo_speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_scanner_infoscreen/servo_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd40719365f052936ed347d15907ec2c2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 servo_angle
    float32 servo_speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new servo_control(null);
    if (msg.servo_angle !== undefined) {
      resolved.servo_angle = msg.servo_angle;
    }
    else {
      resolved.servo_angle = 0.0
    }

    if (msg.servo_speed !== undefined) {
      resolved.servo_speed = msg.servo_speed;
    }
    else {
      resolved.servo_speed = 0.0
    }

    return resolved;
    }
};

module.exports = servo_control;
