
(cl:in-package :asdf)

(defsystem "laser_scanner_infoscreen-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "biometrics" :depends-on ("_package_biometrics"))
    (:file "_package_biometrics" :depends-on ("_package"))
    (:file "biometrics_results" :depends-on ("_package_biometrics_results"))
    (:file "_package_biometrics_results" :depends-on ("_package"))
    (:file "servo_control" :depends-on ("_package_servo_control"))
    (:file "_package_servo_control" :depends-on ("_package"))
    (:file "servo_feedback" :depends-on ("_package_servo_feedback"))
    (:file "_package_servo_feedback" :depends-on ("_package"))
    (:file "stepper_control" :depends-on ("_package_stepper_control"))
    (:file "_package_stepper_control" :depends-on ("_package"))
    (:file "stepper_feedback" :depends-on ("_package_stepper_feedback"))
    (:file "_package_stepper_feedback" :depends-on ("_package"))
  ))