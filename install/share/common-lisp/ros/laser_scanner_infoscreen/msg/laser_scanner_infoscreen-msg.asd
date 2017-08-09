
(cl:in-package :asdf)

(defsystem "laser_scanner_infoscreen-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "biometrics" :depends-on ("_package_biometrics"))
    (:file "_package_biometrics" :depends-on ("_package"))
  ))