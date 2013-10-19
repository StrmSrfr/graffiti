(in-package #:graffiti)

(defclass graffito ()
  ((ip
    :accessor ip
    :initarg :ip)
   (date
    :accessor date
    :initarg :date)
   (message
    :accessor message
    :initarg :message)))

    
