;;;; graffiti.asd

(asdf:defsystem #:graffiti
  :serial t
  :description "A web application that allows users to post messages."
  :author "Samuel Edwin Ward <seward@cytochro.me>"
  :license "Public Domain"
  :depends-on (#:alexandria
               #:cl-who
               #:css-lite
               #:bordeaux-threads
               #:hunchentoot
               )
  :components ((:file "package")
               (:file "graffiti")
               (:file "graffito")))

