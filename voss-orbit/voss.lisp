;;;; Voss's Method
;;;;   Martin Gardner (1978) by way of "Musimathics, Vol 1" p.358

(load "util.lisp")

(defun voss-method (calls)
  (let ((basis (loop for c in calls collecting 0)))
    (lambda (n)
      (setf basis (loop for b in basis
                        for k from 0 to (1- (list-length basis)) collecting
                        (if (zerop (mod n (expt 2 k)))
                          (funcall (nth k calls))
                          b)))
      (apply #'+ basis))))

(defparameter *equations*
  (list (voss-method (list           ; pitch
                       (value-iterator '(1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 0))
                       (value-iterator '(0 2 2 2 0 0 2 2 2 0 0 2 2 2 0 0 2 2 0))
                       (value-iterator '(1 1 1 0 0 1 1 1 1 1 0 0 1 1 1 1 0))
                       (value-iterator '(0 0 0 0 2 2 0 0 1 2 0))))
        (voss-method (list           ; rhythm
                       (value-iterator '(0 8 0 4 0 2 0) 4)
                       (value-iterator '(4 0 2 0 1) 2)
                       (value-iterator '(0 2 0) 1)
                       (value-iterator '(1 0))))
        (voss-method (list           ; velocity
                       (value-iterator '(0 1 1 1 0 1 0))
                       (value-iterator '(1 1 0 1 1))
                       (value-iterator '(0 1 1))
                       (value-iterator '(1 0))))))

(defun playequation (n)
  (let ((outfh (run-program "./playequation"
                            :input :stream :output :terminal)))
    (when outfh
      (capture-stdout outfh (plot-equations 0 (1- n) *equations*))
      (close outfh))))

(playequation 439)
