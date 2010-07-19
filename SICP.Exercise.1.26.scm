;;; Exercise 1.26

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;;; The above code becomes theta(n) because it stops
;;; using sucessive squaring. In Loius' case, this function
;;; is using deferred operations (* ...) to calculate expmod
;;; which will grow with base, our n value. 