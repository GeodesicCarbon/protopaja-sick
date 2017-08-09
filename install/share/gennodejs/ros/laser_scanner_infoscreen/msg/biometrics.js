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

class biometrics {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.poi_range = null;
      this.poi_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('poi_range')) {
        this.poi_range = initObj.poi_range
      }
      else {
        this.poi_range = 0.0;
      }
      if (initObj.hasOwnProperty('poi_angle')) {
        this.poi_angle = initObj.poi_angle
      }
      else {
        this.poi_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type biometrics
    // Serialize message field [poi_range]
    bufferOffset = _serializer.float32(obj.poi_range, buffer, bufferOffset);
    // Serialize message field [poi_angle]
    bufferOffset = _serializer.float32(obj.poi_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type biometrics
    let len;
    let data = new biometrics(null);
    // Deserialize message field [poi_range]
    data.poi_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [poi_angle]
    data.poi_angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_scanner_infoscreen/biometrics';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '843f8ba22bd226dde30b856c2778cd05';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 poi_range
    float32 poi_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new biometrics(null);
    if (msg.poi_range !== undefined) {
      resolved.poi_range = msg.poi_range;
    }
    else {
      resolved.poi_range = 0.0
    }

    if (msg.poi_angle !== undefined) {
      resolved.poi_angle = msg.poi_angle;
    }
    else {
      resolved.poi_angle = 0.0
    }

    return resolved;
    }
};

module.exports = biometrics;
