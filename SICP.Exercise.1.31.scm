;;; Exercise 1.31

;part A

(define (square x)
  (* x x))

(define (identity x) x)

(define (product f lo hi)
  (if (> lo hi)
      1
      (* (f lo) (product f (+ lo 1) hi))))


(product square 1 3) ;this works

(define (factorial x)
  (product identity 1 x))

(factorial 5) ; this works



(define (mmm-pi n)
  (define (yk-top k)
    (if (even? k)
        (+ k 2)
        (+ k 1)))
  (define (yk-bot k)
    (if (even? k)
        (+ k 1)
        (+ k 2)))
  (* 4
     (/ (product-iter yk-top 1 n)
        (product-iter yk-bot 1 n))))

(mmm-pi 169)

;Part B

;iterative process

(define (product-iter f lo hi)
  (define (iter lo result)
    (if (> lo hi)
        result
        (iter (+ lo 1) (* result (f lo)))))
  (iter lo 1))

(define (factorial-iter x)
  (product-iter identity 1 x))

(factorial-iter 5)