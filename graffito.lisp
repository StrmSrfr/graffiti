(in-package #:graffiti)

(defclass graffito ()
  ((date
    :accessor date
    :initarg :date
    :type unsigned-byte)
   (ip
    :accessor ip
    :initarg :ip)
   (message
    :accessor message
    :initarg :message)))

(defun read-graffito (&optional stream)
  (let ((line (read-line stream)))
    (destructuring-bind ((date ip) rem)
        (multiple-value-list (split-sequence #\: line :count 2))
      (let ((message (subseq line rem)))
        (make-instance 'graffito
                       :date (parse-integer date)
                       :ip ip
                       :message message)))))

(defun load-graffiti-from-file (&optional (filename "graffiti.txt") (count 4096))
  (with-open-file (stream filename)
    (setf *graffiti* nil)
    (handler-case
        (loop
           do (setf *graffiti*
                    (cons (read-graffito stream)
                          (subseq *graffiti* 0 (min (length *graffiti*)
                                                    (1- count))))))
      (end-of-file ()
        (values)))))
