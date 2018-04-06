;;; Alexander is the 3nd edition of @slightlycyborgs daemon software. It represents a person's spirit animal, much like in the book series "His Dark Materials". In that book series, everyone is born with a daemon, which is an animal that is able to communicate with its human. If the animal and human are seperated by any great distance, it is painful for each of them. Human + Software symbiosis will feel very similar to this daemon concept, which is why I wish to personify and act out that attachment through robots that are inspired by animals. This idea reminds me of the cute feature film "9" which featured rag dolls technologically brought to life after their owner dies.

;;;; The practical intent of this software is that it will enable robots to do useful tasks in a verry organic setting such as a garden, factory, or terraforming project.

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


(defparameter loving-adjectives
  '(
    "special"
    "sexy"
    "sweet"
    "a good programmer"
    "a fit man"
    "a passionate person"
    "a loving gardener"
    "a genius"
    "a remarkable man"))

(defun random-loving-adjective ()
  (nth (random (length loving-adjectives)) loving-adjectives))

(defun i-love-you (because)
  (say (concatenate 'string "I love you because you are " because)))

(defun i-love-you-lovingly ()
  (i-love-you (random-loving-adjective)))

(defun fuck-me ()
  (loop for i in '(0 1 2 3)
        do (say "Fuck me")))


(defun you-are-beautiful ()
 (i-love-you "so beautiful"))


(defun epic-you-are-beautiful ()
  (loop for i in '(0 1 2 3 4 5)
        do (you-are-beautiful)))

(defun give-advice ()
  (say "Get to work"))

(defun ra-ra-speach ()
  (say "Search far and wide. Expend more energy than the next guy. Go for an order of magnitude more energy spent tomorrow"))


;;; Collin's responses

(defun give-me-advice ()
  (give-advice))

