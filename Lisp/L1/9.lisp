;9a)Write a function that merges two sorted linear lists and keeps double values.

(defun merges (a b)
    (cond
        ((null a) b)
        ((null b) a)
        ((> (car a) (car b)) (cons (car b) (merges a (cdr b))))
        (T (cons (car a) (merges (cdr a) b)))
    )
)

(print (merges '(1 2 3 3) '(3 4 6 6 8)))


;9d)Write a function to return the greatest common divisor of all numbers in a linear list.
(defun gcd (a b)
    (cond 
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((< a b) (gcd b a))
        ((equal b 0) a)
        (T (gcd b (mod a b)))
    )
)

;(print (gcd '10 '20))
(defun gcdList(a aux)
    (cond 
        ((null a) aux)
        (T (gcdList (cdr a) (gcd (car a) aux)))
    )

)

(print (gcdList '(24 16 12 72) 0))