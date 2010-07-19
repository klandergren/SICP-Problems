;;; Exercise 1.33

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (mult x y) (* x y))
(define (add x y) (+ x y))
(define (sos x y) (+ (square x) (square y)))

; Prime Procedures
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

;;;Part A

(define (filter-accumulate-rec comb
                               null-value
                               term
                               a
                               next
                               b
                               filter?)
  (if (<= a b)  ; I'm not positive if using <= is going to be OK here
      (if (filter? a)
          (comb (term a) (filter-accumulate-rec comb
                                                null-value
                                                term
                                                (next a)
                                                next
                                                b
                                                filter?))
          (filter-accumulate-rec comb
                                 null-value
                                 term
                                 (next a)
                                 next
                                 b
                                 filter?))
      null-value))
      

(define (sos-prime a b)
  (filter-accumulate-rec add 1 square a inc b prime?))

(sos-prime 1 5)   ;40 correct

;;; Part B

;skipped

