;;; Exercise 2.04

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 3 2))  ;this works

;definition of cdr
(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 4 3))


