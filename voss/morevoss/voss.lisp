;;;; More Voss's Method
;;;; 
;;;; Only tested with clisp.

(load "../util.lisp")

(setq *random-state* (make-random-state t))

(defun voss-method (calls &optional
                          (summer (lambda (a) (reduce #'+ a))))
  (let ((values (make-array (list-length calls)
                            :element-type 'integer
                            :initial-element 0)))
    (lambda (n)
      (dotimes (k (length values))
        (if (zerop (mod n (expt 2 k)))
          (setf (elt values k) (funcall (nth k calls)))))
      (funcall summer values))))

(defun voss-stateless-method (calls &optional
                                    (summer (lambda (a) (reduce #'+ a))))
  (lambda (n)
    (funcall summer
             (loop for k from 0 to (1- (list-length calls)) collecting
                   (if (zerop (mod n (expt 2 k)))
                     (funcall (nth k calls))
                     0)))))

(defparameter *equations*
  (list (voss-method (list           ; pitch
                       (lambda () (- (random 2) 1))
                       (lambda () (- (random 2) 1))
                       (lambda () (- (random 2) 1))
                       (lambda () (- (random 2) 1))
                       (value-iterator '(0 0 2 1 1 2 0))))
        (voss-method (list           ; rhythm
                       (value-iterator '(0 -1 0 -1 0 -1 0 0 -1 0 0 -1))
                       (lambda () 1)
                       (value-iterator '(0 0 0 1 0 0 1 0 0 0 1 0 0)))
                     (lambda (a) (max 0 (reduce #'+ a))))
        (voss-stateless-method (list ; velocity
                                 (value-iterator '(2 0 0 1 0 0 1 0 0 0 1 0 1 0 0 0)))
                               (lambda (a) (max 0 (reduce #'+ a))))))

(defun playequation (n)
  (let ((outfh (run-program "./playequation"
                            :input :stream :output :terminal)))
    (when outfh
      (capture-stdout outfh (plot-equations 0 (1- n) *equations*))
      (close outfh))))

(playequation 689)
