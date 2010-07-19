;;; Exercise 1.42


(define (square x)
  (* x x))

(define (inc x) (+ x 1))

;this composition function takes two procedures as arguments
;and implemetns x --> f1(f2(x))
(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

((compose square inc) 6)   ;this works