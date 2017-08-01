
(cl:in-package :asdf)

(defsystem "laser_scanner_infoscreen-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "trackObjects" :depends-on ("_package_trackObjects"))
    (:file "_package_trackObjects" :depends-on ("_package"))
  ))