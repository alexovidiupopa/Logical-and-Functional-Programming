(defun transform (l)
(cond
	((null (car l)) nil)
	((null (cadr l)) (append (list (car l)  0)))
	((null (caddr l))(append (list (car l) 1) (transform (cadr l))))
	(T (append (list (car l) 2) (transform (cadr l)) (transform (caddr l))))
)
)
(print (transform '(A (B) (C (D) (E)))))
(print (transform '(A(B(D)(E(F(G)(H))))(C(I(J(K)))))))

	