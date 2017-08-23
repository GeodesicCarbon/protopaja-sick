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

class external_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.zoom_level = null;
      this.area_active = null;
      this.gesture = null;
    }
    else {
      if (initObj.hasOwnProperty('zoom_level')) {
        this.zoom_level = initObj.zoom_level
      }
      else {
        this.zoom_level = 0;
      }
      if (initObj.hasOwnProperty('area_active')) {
        this.area_active = initObj.area_active
      }
      else {
        this.area_active = 0;
      }
      if (initObj.hasOwnProperty('gesture')) {
        this.gesture = initObj.gesture
      }
      else {
        this.gesture = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type external_control
    // Serialize message field [zoom_level]
    bufferOffset = _serializer.int16(obj.zoom_level, buffer, bufferOffset);
    // Serialize message field [area_active]
    bufferOffset = _serializer.int16(obj.area_active, buffer, bufferOffset);
    // Serialize message field [gesture]
    bufferOffset = _serializer.int16(obj.gesture, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type external_control
    let len;
    let data = new external_control(null);
    // Deserialize message field [zoom_level]
    data.zoom_level = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [area_active]
    data.area_active = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gesture]
    data.gesture = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_scanner_infoscreen/external_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c278a2cd5011b0416a9f6f215c70966a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 zoom_level
    int16 area_active
    int16 gesture
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new external_control(null);
    if (msg.zoom_level !== undefined) {
      resolved.zoom_level = msg.zoom_level;
    }
    else {
      resolved.zoom_level = 0
    }

    if (msg.area_active !== undefined) {
      resolved.area_active = msg.area_active;
    }
    else {
      resolved.area_active = 0
    }

    if (msg.gesture !== undefined) {
      resolved.gesture = msg.gesture;
    }
    else {
      resolved.gesture = 0
    }

    return resolved;
    }
};

module.exports = external_control;
