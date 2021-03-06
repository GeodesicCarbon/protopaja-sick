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

class stepper_feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.screen_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('screen_angle')) {
        this.screen_angle = initObj.screen_angle
      }
      else {
        this.screen_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stepper_feedback
    // Serialize message field [screen_angle]
    bufferOffset = _serializer.float32(obj.screen_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stepper_feedback
    let len;
    let data = new stepper_feedback(null);
    // Deserialize message field [screen_angle]
    data.screen_angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_scanner_infoscreen/stepper_feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '400631f2b01dbd17dd32daf8906e9197';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 screen_angle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stepper_feedback(null);
    if (msg.screen_angle !== undefined) {
      resolved.screen_angle = msg.screen_angle;
    }
    else {
      resolved.screen_angle = 0.0
    }

    return resolved;
    }
};

module.exports = stepper_feedback;
