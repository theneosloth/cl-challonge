;;;; cl-challonge.asd

(asdf:defsystem #:cl-challonge
  :description "Describe cl-challonge here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:jonathan #:dexador #:quri)
  :components ((:file "package")
               (:file "cl-challonge")
               (:file "tournaments")))
