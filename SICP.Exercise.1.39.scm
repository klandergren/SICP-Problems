;;; Exercise 1.39

(define (square x)
  (* x x))

(define (n x k)
  (if (= k 1)
      x
      (square x)))

(define (d k)
  (+ k (- k 1)))

(define (cont-frac n d x k)
  (define (iter x i ans)
    (let ((nk (n x i))    ;nk is the numerator
          (dk (d i)))     ;dk is the denominator
      (if (= i 0)
          ans
          (iter x
                (- i 1)
                (/ nk (- dk ans))))))
  (iter x k 0.)) ;using 0. to get a decimal answer

(define (tan-cf x k)
  (cont-frac n d x k))


;Check with this
(tan-cf 1 10)  ;we win

