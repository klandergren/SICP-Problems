;;; Exercise 1.37

;;; Part A

(define (cont-frac n d k)
  (define (iter i ans)
    (let ((nk (n k))
          (dk (d k)))
      (if (= i 0)
          ans
          (iter (- i 1)
                (/ nk (+ dk ans))))))
  (iter k 0))


;Check with this
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ;converges to four decimal accuracy in 11

;;; Part B

(define (cont-frac-rec n d k)
  (define (b k)
    (let ((nk (n k))
          (dk (d k)))
      (if (= k 0)
          (/ nk
             dk)
          (/ nk
             (+ dk (b (- k 1)))))))
  (b k))

(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               12) ;converges to four decimal accuracy in 12
  
