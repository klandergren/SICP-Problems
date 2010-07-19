;;; Exercise 1.30

(define (inc x) (+ x 1))

(define (square x)
  (* x x))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))  ;keep information in result
  (iter a 0))  ;start with a, and result equal to 0

(define (sum-of-squares-iter lo hi)
  (sum-iter square lo inc hi))

(sum-of-squares-iter 0 5) ;it works

