(in-package :cl-challonge)

(defun list-tournaments ()
  (with-api-call ("/v1/tournaments.json")
    resp))

(defun tournament (tournament)
  (with-api-call ((format nil "/v1/tournaments/~a.json" tournament))
    ;; The first object in the response is the response type.
    (cadr resp)))

(defun tournament-participants (tournament)
  (with-api-call ((format nil "/v1/tournaments/~a/participants.json" tournament))
    resp))

(defun participant (tournament participant)
  (with-api-call ((format nil "/v1/tournaments/~a/participants/~a.json" tournament participant))
    (cadr resp)))
