;;; Exercise 1.41

(define (square x)
  (* x x))

(define (inc x) (+ x 1))

(define (double proc)
  (lambda (x) (proc (proc x))))

(double (inc 1))                      ;does not work -- whyyyy
((lambda (x) (square (square x))) 2)  ;this works
((double inc) 1)                      ;ok this works now

(((double (double double)) inc) 5)    ;thought 13, was 21