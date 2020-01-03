;Write a function that reversesa list together with all its sublists elements, at any level

(defun _reverse (l)
	(cond
		((atom l) l)
		((listp l) (mapcar '_reverse (reverse l)))
	)
)

(print (_reverse '(1 (2 3) (4 ( 5 6)))))