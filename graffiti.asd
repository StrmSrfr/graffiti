;;;; graffiti.asd

(asdf:defsystem #:graffiti
  :description "A web application that allows users to post messages."
  :author "Samuel Edwin Ward <seward@cytochro.me>"
  :license "Public Domain"
  :depends-on (#:alexandria
               #:bordeaux-threads
               #:cl-who
               #:css-lite
               #:hunchentoot
               #:net-telent-date
               )
  :components ((:file "package")
               (:file "graffiti" :depends-on ("graffito" "package"))
               (:file "graffito" :depends-on ("package"))))

