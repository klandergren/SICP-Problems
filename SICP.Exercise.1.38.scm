;;; Exercise 1.38


(define (mod x y)
  (remainder x y))


(define (d k)
  (let ((checker (mod k 3)))
    (cond ((= 0 checker) 1)
          ((= 1 checker) 1)
          (else (+ (/ (* 2 k) 3)
                   (/ 2 3))))))

(define (n k) 1.0)

;this calcs the continued fraction expansion for e-2
(define (cont-frac n d k)
  (define (iter i ans)
    (let ((nk (n i))
          (dk (d i)))
      (if (= i 0)
          ans
          (iter (- i 1)
                (/ nk (+ dk ans))))))
  (iter k 0))


;Check with this
(cont-frac n d 100) ; all goes according to plan
