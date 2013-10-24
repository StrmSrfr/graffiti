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
  (with-html-output-to-string (s)
    (:html
     (:head
      (:title "Graffiti 2.0: New and improved!")
      (:style
       (str
        (css
          ((".graffito")
           (:border "1px solid black"
            :padding "4px"
            :margin-top "0.5em"
            :margin-bottom "0.5em"))
          ((".message")
           (:border-left "1px solid grey"
            :padding-left "4px"
            ))
          (("body")
           (:font-family "Futura, Helvetica, sans-serif"))
          (("h1")
            (:font-family "Frutiger, Segoe, Optima, serif"))
          (("p:first-child")
           (:margin-top "0"
                        ))
          (("pre")
           (:font-family "Letter Gothic, Monaco, Menlo, Courier, mono"))
          (("pre:last-child")
           (:margin-bottom "0")))))
      )
     (:body
      (:h1 "Graffiti")
      (:div :id "content"
       (loop for graffito in *graffiti*
            do (htm
                (:div :class "graffito"
                 (:p "At "
                   (:span :class "date"
                     (str
                       (date graffito)))
                   ", "
                   (:span :class "ip"
                     (str (ip graffito)))
                   " wrote:")
                 (:pre :class "message"
                   (str (cl-who:escape-string
                         (message graffito))))))))
      ))))

(defvar *acceptor* nil
  "Hunchentoot acceptor.")

(defvar *port* 57587
  "Port to listen on.")

(defun start ()
  (setf *acceptor*
        (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port *port*))))
