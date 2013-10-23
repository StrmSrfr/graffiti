;;;; graffiti.lisp

(in-package #:graffiti)

(defvar *graffiti* 
  (list (make-instance 'graffito
                       :date 0
                       :ip "127.0.0.1"
                       :message "Hello again, World!"))
  "List of current graffiti")

(hunchentoot:define-easy-handler (index :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")
  (cl-who:with-html-output-to-string (s)
    (:html
     (:head
      (:title "Graffiti 2.0: New and improved!")
      (:style
       (cl-who:str
        (css-lite:css
          ((".graffito")
           (:border "1px solid black"
            :padding "4px"))
          ((".message")
           (:border-left "1px solid grey"
            :padding-left "4px"
            :margin "0.5 em")))
          (("p:first-child")
           (:margin-top "0"
                        ))
          (("pre:last-child")
           (:margin-bottom "0")))))
      )
     (:body
      (:h1 "Graffiti")
      (:div :id "content"
       (loop for graffito in *graffiti*
            do (cl-who:htm
                (:div :class "graffito"
                 (:p "At "
                   (:span :class "date"
                     (cl-who:str (date graffito)))
                   ", "
                   (:span :class "ip"
                     (cl-who:str (ip graffito)))
                   " wrote:")
                 (:pre :class "message"
                   (cl-who:str (cl-who:escape-string
                                (message graffito))))))))
      ))))

(defvar *acceptor* nil
  "Hunchentoot acceptor.")

(defvar *port* 57587
  "Port to listen on.")

(defun start ()
  (setf *acceptor*
        (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port *port*))))
