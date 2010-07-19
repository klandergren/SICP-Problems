;;; Exercise 1.25

;Status: Unfinished
;
;Need to write a time-trial function that tests the two
;procedures to see which is faster. My thought is expmod-
;alyssa but the interwebs disagree...



;old procedures
(define (square x)
  (* x x))

(define (even? x)
  (= (remainder (x 2) 0)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;Alyssa's procedure
(define (expmod-alyssa base exp m)
  (remainder (fast-expt base exp) m))

;testing
(define (timed-test proc n)
  (newline)
  (display n)
  (start-test proc n (runtime)))

(define (start-test proc n start-time)
  (begin
    (proc 13 n 6)
    (report-time (- (runtime) start-time))))

(define (report-time elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-test expmod 10)


   