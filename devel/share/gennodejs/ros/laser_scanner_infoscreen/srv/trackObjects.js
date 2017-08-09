// Auto-generated. Do not edit!

// (in-package laser_scanner_infoscreen.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class trackObjectsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle_min = null;
      this.angle_max = null;
      this.angle_increment = null;
      this.time_increment = null;
      this.scan_time = null;
      this.ranges = null;
    }
    else {
      if (initObj.hasOwnProperty('angle_min')) {
        this.angle_min = initObj.angle_min
      }
      else {
        this.angle_min = 0.0;
      }
      if (initObj.hasOwnProperty('angle_max')) {
        this.angle_max = initObj.angle_max
      }
      else {
        this.angle_max = 0.0;
      }
      if (initObj.hasOwnProperty('angle_increment')) {
        this.angle_increment = initObj.angle_increment
      }
      else {
        this.angle_increment = 0.0;
      }
      if (initObj.hasOwnProperty('time_increment')) {
        this.time_increment = initObj.time_increment
      }
      else {
        this.time_increment = 0.0;
      }
      if (initObj.hasOwnProperty('scan_time')) {
        this.scan_time = initObj.scan_time
      }
      else {
        this.scan_time = 0.0;
      }
      if (initObj.hasOwnProperty('ranges')) {
        this.ranges = initObj.ranges
      }
      else {
        this.ranges = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type trackObjectsRequest
    // Serialize message field [angle_min]
    bufferOffset = _serializer.float32(obj.angle_min, buffer, bufferOffset);
    // Serialize message field [angle_max]
    bufferOffset = _serializer.float32(obj.angle_max, buffer, bufferOffset);
    // Serialize message field [angle_increment]
    bufferOffset = _serializer.float32(obj.angle_increment, buffer, bufferOffset);
    // Serialize message field [time_increment]
    bufferOffset = _serializer.float32(obj.time_increment, buffer, bufferOffset);
    // Serialize message field [scan_time]
    bufferOffset = _serializer.float32(obj.scan_time, buffer, bufferOffset);
    // Serialize message field [ranges]
    bufferOffset = _arraySerializer.float32(obj.ranges, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trackObjectsRequest
    let len;
    let data = new trackObjectsRequest(null);
    // Deserialize message field [angle_min]
    data.angle_min = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle_max]
    data.angle_max = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle_increment]
    data.angle_increment = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [time_increment]
    data.time_increment = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [scan_time]
    data.scan_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ranges]
    data.ranges = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.ranges.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'laser_scanner_infoscreen/trackObjectsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cc1394f89117c0bbb3cdb3982efc44b7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float32 angle_min
    float32 angle_max
    float32 angle_increment
    
    float32 time_increment
    float32 scan_time
    
    float32[] ranges
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new trackObjectsRequest(null);
    if (msg.angle_min !== undefined) {
      resolved.angle_min = msg.angle_min;
    }
    else {
      resolved.angle_min = 0.0
    }

    if (msg.angle_max !== undefined) {
      resolved.angle_max = msg.angle_max;
    }
    else {
      resolved.angle_max = 0.0
    }

    if (msg.angle_increment !== undefined) {
      resolved.angle_increment = msg.angle_increment;
    }
    else {
      resolved.angle_increment = 0.0
    }

    if (msg.time_increment !== undefined) {
      resolved.time_increment = msg.time_increment;
    }
    else {
      resolved.time_increment = 0.0
    }

    if (msg.scan_time !== undefined) {
      resolved.scan_time = msg.scan_time;
    }
    else {
      resolved.scan_time = 0.0
    }

    if (msg.ranges !== undefined) {
      resolved.ranges = msg.ranges;
    }
    else {
      resolved.ranges = []
    }

    return resolved;
    }
};

class trackObjectsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mobiles_x = null;
      this.mobiles_y = null;
      this.statics_x = null;
      this.statics_y = null;
    }
    else {
      if (initObj.hasOwnProperty('mobiles_x')) {
        this.mobiles_x = initObj.mobiles_x
      }
      else {
        this.mobiles_x = [];
      }
      if (initObj.hasOwnProperty('mobiles_y')) {
        this.mobiles_y = initObj.mobiles_y
      }
      else {
        this.mobiles_y = [];
      }
      if (initObj.hasOwnProperty('statics_x')) {
        this.statics_x = initObj.statics_x
      }
      else {
        this.statics_x = [];
      }
      if (initObj.hasOwnProperty('statics_y')) {
        this.statics_y = initObj.statics_y
      }
      else {
        this.statics_y = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type trackObjectsResponse
    // Serialize message field [mobiles_x]
    bufferOffset = _arraySerializer.float32(obj.mobiles_x, buffer, bufferOffset, null);
    // Serialize message field [mobiles_y]
    bufferOffset = _arraySerializer.float32(obj.mobiles_y, buffer, bufferOffset, null);
    // Serialize message field [statics_x]
    bufferOffset = _arraySerializer.float32(obj.statics_x, buffer, bufferOffset, null);
    // Serialize message field [statics_y]
    bufferOffset = _arraySerializer.float32(obj.statics_y, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trackObjectsResponse
    let len;
    let data = new trackObjectsResponse(null);
    // Deserialize message field [mobiles_x]
    data.mobiles_x = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [mobiles_y]
    data.mobiles_y = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [statics_x]
    data.statics_x = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [statics_y]
    data.statics_y = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.mobiles_x.length;
    length += 4 * object.mobiles_y.length;
    length += 4 * object.statics_x.length;
    length += 4 * object.statics_y.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'laser_scanner_infoscreen/trackObjectsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2855158969d60cc17322353cb754d289';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] mobiles_x
    float32[] mobiles_y
    
    
    
    float32[] statics_x
    float32[] statics_y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new trackObjectsResponse(null);
    if (msg.mobiles_x !== undefined) {
      resolved.mobiles_x = msg.mobiles_x;
    }
    else {
      resolved.mobiles_x = []
    }

    if (msg.mobiles_y !== undefined) {
      resolved.mobiles_y = msg.mobiles_y;
    }
    else {
      resolved.mobiles_y = []
    }

    if (msg.statics_x !== undefined) {
      resolved.statics_x = msg.statics_x;
    }
    else {
      resolved.statics_x = []
    }

    if (msg.statics_y !== undefined) {
      resolved.statics_y = msg.statics_y;
    }
    else {
      resolved.statics_y = []
    }

    return resolved;
    }
};

module.exports = {
  Request: trackObjectsRequest,
  Response: trackObjectsResponse,
  md5sum() { return '38f224ce5c574709b4afb6c1105a6437'; },
  datatype() { return 'laser_scanner_infoscreen/trackObjects'; }
};
