(load "timer.lisp")
(ql:quickload :parachute)

(defpackage :core
  (:use :timer :cl :parachute))

(in-package :core)
(defun say (text)
  (sb-ext:run-program "/usr/bin/say" (list "-v" "Victoria" text)))

(defun initialize-todos ()
  (load "timer.lisp")
  (load "todo/main.lisp"))

;;; Rouge's responses

(defun epic-fuck-you ()
  (loop for i in '(0 1 2 3 4 5 6 7 8 9)
       do (say "Fuck you")))


(defun epic-i-love-you ()
  (loop for i in '(0 1 2 3 4 5 6 7 8 9)
        do (say "I love you!")))


(defun talk-to-me ()
  (say "Please talk to me"))


(defun polite-fuck-you ()
  (say "Excuse me sir.")
  (sleep 0.5)
  (say "Fuck you."))


(defun i-love-you (because)
  (say (concatenate 'string "I love you because " because)))

(defun fuck-me ()
  (loop for i in '(0 1 2 3)
        do (say "Fuck me")))


(defun you-are-beautiful ()
 (i-love-you "you are so beautiful"))


(defun epic-you-are-beautiful ()
  (loop for i in '(0 1 2 3 4 5)
        do (you-are-beautiful)))

(defun give-advice ()
  (say "Get to work"))


;;; Collin's responses

(defun give-me-advice ()
  (give-advice))
