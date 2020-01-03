;Write a function that returns the maximum of numeric atoms in a list,at any level

(defun getmax(l max)
    (cond 
        ((and (numberp l) (if (> l max) l max)))
        ((listp l) (mapcar #'(lambda (a) (getmax a max)) l)))
        (t 0)
    )
)

(print (getmax '(1 2 B 3 (-1 A (100))) 0))