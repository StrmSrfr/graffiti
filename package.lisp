;;;; package.lisp

(defpackage #:graffiti
  (:use #:cl)
  (:import-from #:cl-who
    ; not escape-string because that might be confusing
    #:htm
    #:str
    #:with-html-output-to-string)
  (:import-from #:css-lite
    #:css)
  (:import-from #:net.telent.date
    #:universal-time-to-http-date)
  (:export #:start))

