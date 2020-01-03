;Write a function that substitutes an elementE withall elements of alist L1 at alllevels of a given list L

(defun subst2 (l e l1)
    (cond 
        ((and (atom l) (eq l e)) l1)
        ((and (atom l) (not (eq l e))) l)
        (t (mapcar #'(lambda (a) (subst2 a e l1)) l))
    )
)

(print (subst2 '(1 2 3 4 1 (1)) 1 '(5 5)))