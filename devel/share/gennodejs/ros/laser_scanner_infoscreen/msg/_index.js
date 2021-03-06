
"use strict";

let servo_feedback = require('./servo_feedback.js');
let biometrics = require('./biometrics.js');
let stepper_control = require('./stepper_control.js');
let stepper_feedback = require('./stepper_feedback.js');
let external_control = require('./external_control.js');
let biometrics_results = require('./biometrics_results.js');
let gesture_call = require('./gesture_call.js');
let servo_control = require('./servo_control.js');

module.exports = {
  servo_feedback: servo_feedback,
  biometrics: biometrics,
  stepper_control: stepper_control,
  stepper_feedback: stepper_feedback,
  external_control: external_control,
  biometrics_results: biometrics_results,
  gesture_call: gesture_call,
  servo_control: servo_control,
};
