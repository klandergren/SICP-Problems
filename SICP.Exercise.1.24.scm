;;; Exercise 1.24


(define (square x)
  (* x x))

;;;here be new functions

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;;;

(define (report-prime n elapsed-time) ;modified
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)  ;modified
  (if (fast-prime? n 10000) ;using 1000 to increase times
      (report-prime n (- (runtime) start-time))))

(define (timed-prime-test n)   
  (if (fast-prime? n 10) 
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

(search-for-primes 1000 1050)           ;~0.35
(search-for-primes 1000000  1000100)    ;~0.75
                                        ;ratio: ~2


;test times for primes near 1 000 000 000 should be a constant
;amount longer than those near 1000. The computation times are
;relatively large because I ran fast-prime? 10000 times. On the
;order of ~10 iterations would be more than sufficient for these
;demonstrations, and if changed, computation times are _blazing_
;fast.

