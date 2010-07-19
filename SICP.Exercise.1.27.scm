;;; Exercise 1.27

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        
;prime procedures
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;this procedure is kind of bad because it will
;always set up a<n tests and then execute
;all, instead of just stopping when it finds
;a false.
(define (carmichael-helper a n)
  (if (< a n)
      (AND (= (expmod a n n) a) (tester (+ a 1) n))))

(define (carmichael? n)
  (AND (carmichael-helper 0 n) (not (prime? n))))

(carmichael? 13)    ;testing a prime
(carmichael? 561)   ;testing 1st carmichael number
(carmichael? 1000)  ;testing generic
(carmichael? 2465)  ;testing 2nd carmichael

