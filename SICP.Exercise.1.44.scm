;;; Exercise 1.44

(define dx 0.000001)

(define (average-three x y z)
  (/ (+ x y z)
     3))

(average-three 3 4 5)  ;4 correct

;this composition function takes two procedures as arguments
;and implemetns x --> f1(f2(x))
(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

(define (my-function x)
  (* x x x))

(define (smooth f)
  (lambda (x) (average-three (f (- x dx))
                             (f x)
                             (f (+ x dx)))))

((smooth my-function) 3)

(define (repeated proc n)
  (cond ((= n 0) proc)
        ((= n 1) proc)
        (else (compose proc (repeated proc (- n 1))))))

((repeated square 4) 5) ;;huzzah this works

(define (n-folded-smooth f)
  ((repeated smooth 2) f))

((n-folded-smooth my-function) 3)

