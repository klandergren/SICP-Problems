;;; Sunny Problem 001

(define (sum x y)
  (if (> x y)
      0
      (+ x (sum (+ x 1) y))))


(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))



(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (even? x)
  (= (remainder x 2) 0))

(define (accumulate term lo next hi)
  (if (> lo hi)
      0
      (+ (term lo)
         (accumulate term (next lo) next hi))))

(define (new-accumulate condition term lo next hi)
  (if (condition lo)
      (if (> lo hi)
          0
          (+ (term lo)
             (new-accumulate condition term (next lo) next hi)))
      (new-accumulate condition term (next lo) next hi)))

;sum square only evens
(define (ssoe lo hi)
  (new-accumulate even? square lo inc hi))

;sum primes
(define (sp lo hi)
  (new-accumulate prime? square lo inc hi))

(prime? 13)

(sp 1 5)

(ssoe 1 7)


;for sum-of-squares
(define (sum-of-squares lo hi)
  (accumulate square lo inc hi))

(sum-of-squares 1 3)

(define (sum-of-cubes lo hi)
  (accumulate cube lo inc hi))

(sum-of-cubes 1 3)