;;; Exercise 2.1

(define (make-rat n d)
  (cond ((and (>= n 0) (< d 0)) (cons (- 0 n) (abs d))) ;if +/- -/+
        ((and (< n 0) (< d 0)) (cons (abs n) (abs d)))  ;if -/- +/+
        (else (cons n d))))  ;else is OK

(define test (make-rat (- 0 1) (- 0 1)))

;Testing
(car test)
(cdr test)





;procedures
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
