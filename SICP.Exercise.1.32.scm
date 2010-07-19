;;; Exercise 1.32

;;;Part A

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (mult x y) (* x y))

(define (add x y) (+ x y))

(define (accumulate comb
                    null-value
                    term
                    a
                    next
                    b)
  (if (> a b)
      null-value
      (comb (term a) (accumulate comb
                                 null-value
                                 term
                                 (next a)
                                 next
                                 b))))

(accumulate mult 1 identity 1 inc 4) ; 24 correct

(define (product a b)
  (accumulate mult 1 identity a inc b))

(product 1 5) ;120 correct

(define (sum a b)
  (accumulate add 0 identity a inc b))

(sum 1 10)   ; 55 correct


;;;Part B

(define (accumulate-iter comb
                    null-value
                    term
                    a
                    next
                    b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (inc a) (comb (term a) result))))
  (iter a null-value))

(define (product-iter a b)
  (accumulate-iter mult 1 identity a inc b))

(product-iter 1 5) ; 120 correct!

(define (sum-iter a b)
  (accumulate-iter add 0 identity a inc b))

(sum-iter 1 10)  ; 55 correct!