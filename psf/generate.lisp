;;;; Generates numbers via a summation of sin() calls. Assumes clisp.
;;;; Subsequent steps assume sh, Perl, and various Perl modules installed.
;;;; Possibly also lilypond, a MIDI player, etc.

(defmacro clobber-file (file)
  `(open ,file :direction :output :if-exists :supersede))

(defun log-some (fn file min max step)
  (let ((out (clobber-file file)))
    (when out
      (loop for n from min to max by step do
            (format out "~d~%" (round (funcall fn n))))
      (close out))))

(defun playit (period howmany)
  (log-some *eqtn* "numbers" 0 (1- howmany) period)
  (run-program "./playequation" :input nil :output nil))

(defun remake-equation ()
  (let ((eqns (list
              (lambda (x) (* 2.3878949 (sin (+ (* 4.186179 x) 5.1577654))))
              (lambda (x) (* 0.22122727 (sin (+ (* 2.0276203 x) 1.1410718))))
              (lambda (x) (* 1.1352451 (sin (+ (* 0.17621815 x) -4.958387)))))))
    (lambda (x) (loop for f in eqns summing (funcall f x)))))

(setf *eqtn* (remake-equation))
(playit 0.5 486)
