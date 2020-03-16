;;;; cl-challonge.lisp

(in-package #:cl-user)

(in-package :cl-challonge)

(defparameter *token* (uiop:getenv "CHALLONGE_TOKEN"))

(defun set-token (token)
  "Changes the API token used for all api calls to TOKEN."
  (setq *token* token))

(defun load-url-as-json (url)
  "Loads a given URL into a normalized property list."
  (jojo:parse
   (dex:get url :verbose t)
   :keyword-normalizer #'string-upcase
   :normalize-all t))

(defun make-url (path &optional params (token *token*))
  "Creates a url from PATH, an alist of PARAMS and an api TOKEN."
  (let ((base "https://api.challonge.com"))
    (quri:make-uri
     :defaults base
     :path path
     :query (append `(("api_key" . ,token)) params))))


(defmacro with-api-call ((path &key (params nil)) &body body)
  "Loads the given subpath into the resp local variable."
  (let ((resp (intern (symbol-name 'resp))))
    `(let ((,resp (load-url-as-json (make-url ,path ,params))))
       ,@body)))


(defun fmt (control-string &rest arguments)
  (apply #'format (append (list nil control-string) arguments)))
