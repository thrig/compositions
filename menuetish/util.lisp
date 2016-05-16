;;;; Various utility functions and macros (mostly from ~/.clisprc.lisp only
;;;; doubled here so don't also have to depend externally on that file).

(defmacro % (a b) `(mod (truncate ,a) (truncate ,b)))

(defun argn-to-integer (idx)
  (let ((args (cli-args)))
    (if (>= (1- (list-length args)) idx)
      (parse-integer (elt args idx))
      nil)))

;;; just the command line arguments, if any
(defun cli-args ()
  #+CLISP ext:*args*
  #+SBCL (cdr *posix-argv*)                ; nix the program name
  #-(or CLISP SBCL) (error "Unimplemented"))

;;; nixes return value (though there's still a trailing blank line in
;;; `clisp -q -q -x ...` output).
(defmacro no-return (&body body)
    `(progn ,@body (values)))

(defmacro random-list-item (alist)
  `(progn
     (or (listp ,alist)
         (error "random-list-item needs a list to act on"))
     (nth (random (list-length ,alist)) ,alist)))

; as (last vector) barfs with not-a-list
(defmacro vector-last (v) `(elt ,v (1- (length ,v))))
(defmacro vector-index (v) `(1- (length ,v)))
