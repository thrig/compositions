;;;; Various utility functions and macros.

(defmacro append-file (file)
  `(open ,file
         :direction :output
         :if-exists :append
         :if-does-not-exist :create))

(defmacro capture (stream where &body body)
  (let ((out (gensym)))
    `(progn
       (if (streamp ,where)
         (setf ,out ,where)
         (setf ,out (append-file ,where)))
       (when ,out
         (let ((,stream ,out)) ,@body)
         (if (not (streamp ,where))
           (close ,out))))))

(defmacro capture-stdout (where &body body)
  `(capture *standard-output* ,where ,@body))

(defun plot-equations (min max equations)
  (loop for n from min to max by 1 do
        (setf nums (loop for c in equations collecting
                         (round (funcall c n))))
;       (warnx "~{~d ~}~%" nums)        ; DBG
        (format t "~{~d ~}~%" nums)))

(defun silence ()
    (run-shell-command "pkill timidity")
    (quit))

;;; Loops over a list of items with a return to beginning of list
;;; as the pointer falls off the end (ported from nexti method
;;; of the Perl Music::AtonalUtil module).
(defmacro value-iterator (list &optional (start 0 start-p))
  (let ((values (gensym)) (curv (gensym)))
    `(progn
       (setf ,values ,list)
       (setf ,curv (if ,start-p ,start 0))
       (if (>= ,curv (list-length ,values)) (setf ,curv 0))
       (lambda ()
         (let ((ret (nth ,curv ,values)))
           (incf ,curv)
           (if (>= ,curv (list-length ,values)) (setf ,curv 0))
           ret)))))

;;; Lisp already has (warn) but I want something similar that emits to
;;; stderr but without the WARNING prefix of (warn). So, copy a C
;;; system call.
(defmacro warnx (format &rest args)
  `(progn
     (format *error-output* ,format ,@args)
     (fresh-line *error-output*)))
