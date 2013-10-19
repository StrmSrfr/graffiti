;;;; graffiti.lisp

(in-package #:graffiti)

(defvar *graffiti* nil
  "List of current graffiti")

(hunchentoot:define-easy-handler (index :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")
  (cl-who:with-html-output-to-string (s)
    (:html
     (:head
      (:title "Graffiti 2.0: New and improved!")
      )
     (:body
      (:h1 "Graffiti")
      (:table
       (loop for graffito in *graffiti*
            do (cl-who:htm
                (:tr
                 (:td (cl-who:str (date graffito)))
                 (:td (cl-who:str (ip graffito)))
                 (:td (cl-who:str (message graffito)))))))
      ))))

(defvar *acceptor* nil
  "Hunchentoot acceptor.")

(defvar *port* 57587
  "Port to listen on.")

(defun start ()
  (setf *acceptor*
        (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port *port*))))
