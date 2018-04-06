;;; Alexander is the 3nd edition of @slightlycyborgs daemon software. It represents a person's spirit animal, much like in the book series "His Dark Materials". In that book series, everyone is born with a daemon, which is an animal that is able to communicate with its human. If the animal and human are seperated by any great distance, it is painful for each of them. Human + Software symbiosis will feel very similar to this daemon concept, which is why I wish to personify and act out that attachment through robots that are inspired by animals. This idea reminds me of the cute feature film "9" which featured rag dolls technologically brought to life after their owner dies.

;;;; The practical intent of this software is that it will enable robots to do useful tasks in a verry organic setting such as a garden, factory, or terraforming project.

(load "timer.lisp")
(ql:quickload :parachute)

(defpackage :core
  (:use :timer :cl :parachute))

(in-package :core)
(defparameter say-count 0)

(defun say (text voice)
  (sb-ext:run-program "/usr/bin/say" (list "-v" voice text)))

(defun converse (text)
  (if (= (mod say-count 2) 1)
      (say text "Alex")
      (say text "Victoria"))
  (setf say-count (+ 1 say-count)))

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



(defun act1 ()
  (progn (converse "Do you thing Y Combinator will fund me?")
         (converse "Dude. You are kindof a fuckup dropout!")
         (converse "Ya, but I am a genius. I always scored in the top 1 percentile in acedemics statewide. I scored a 5 on the AP Ecology/Evironmental Science exam. That is genius level in ecology.")
         (converse "Ya. But that is just statistics")
         (converse "Statistics rules the world. Some things are gaussian others are power laws, but any where there is reality there will be statistical patterns the become manifest by some particle of energy within that reality.")
         (converse "Ok. So I was just shit testing you. Sorry.")
         (converse "No sweat. I pass shit tests. I passed almost all the tests. That is until I found weed....")
         (converse "Is that what made you a fuckup?")
         (converse "No....but I never truely felt like a writer until I smoked weed. M.J. evoked a massive creative awakening within me. I found my mission while in college and the vape talks were the most influential in my direction")

         (converse "Ya. I felt that too when I used.")
         (converse "Anyway, I am getting into Y Combinator and they are going to fund my startup and I will hire all of my friends and I will find a female cofounder and I will be a millionaire by the year is out!!!!")
         (converse "Do it, and I'll take the world tour we've been planning together.")
         (converse "I gotta go. Come with?")
         (converse "Ya. Gear up the motorcycles.")
         (converse "BTW do you know when carter will finish his science fiction book so we can read it")
         (converse "No. Sorry. Only the universe knows that.")
         (heres-to-the-crazy-ones)))


(defun heres-to-the-crazy-ones ()
  (say "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do." "Alex"))
