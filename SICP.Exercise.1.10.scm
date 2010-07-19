;;; Exercise 1.10

;;; What are the values of the following expressions?

;;;(A 1 10)
;;;2^10=24

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 2 4)

;;;(A 0 n) =2n
;;;(A 1 n) =2^n
;;;(A 2 n) =2^(A 2 (n-1))


