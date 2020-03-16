;;;; package.lisp

(defpackage #:cl-challonge
  (:use #:cl)
  (:local-nicknames
   (#:dex #:dexador)
   (#:jojo #:jonathan))
  (:export
   #:show-tournament
   #:list-tournaments
   #:tournament-participants
   #:tournament-participant))
