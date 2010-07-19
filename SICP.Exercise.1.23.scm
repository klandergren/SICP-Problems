;;; Exercise 1.23

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

;new procedure that tests 2,3,5,7,9...
;instead of 2,3,4,5,6...
(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime n elapsed-time) ;modified
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)  ;modified
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (timed-prime-test n)   ;moved if prime? from start-prime-est
  (if (prime? n)
      (start-prime-test n (runtime))))

(define (search-for-primes low high)
  (if (< low high)
      (sfp-iter low high)
      (display "Invalid Input")))

(define (sfp-iter low high)
  (timed-prime-test low)
  (cond ((> low high) "Finished")
        ((even? low) (sfp-iter (+ low 1) high)) ;start with odd
        (else (sfp-iter (+ low 2) high))))      ;check only odd


;testing

(search-for-primes 1000000000 1000000021)       ; (new/old) 0.049/0.09 
(search-for-primes 10000000000 10000000061)     ; (new/old) 0.17/0.28 
(search-for-primes 100000000000 100000000057)   ; (new/old) 0.55/0.91
(search-for-primes 1000000000000 1000000000063) ; (new/old) 1.76/3.01

;finding ratio of algorithms

(/ (+ (/ 0.09 0.049)
      (/ 0.28 0.17)
      (/ 0.55 0.91)
      (/ 3.01 1.76))
   4)                    ;1.45

;With the revised test-divisor, process times
;were effectively sqrt(2)/2 faster. This is because
;the number of operations performed by test-divisor
;grows as sqrt(n) and by eliminating half of the n
;values, I expect it to grow as (sqrt(n/2))


;note:i should write a 'closest fraction' procedure...