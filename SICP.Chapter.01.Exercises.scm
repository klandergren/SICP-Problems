;;; Kip Landergren
;;; 2010.02.11

;;; Exercise 1.1

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a ) b a))
(* (cond ((> a b ) a)
         ((< a b) b)
         (else -1))
   (+ a 1))


;;; Exercise 1.2

(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

(define square (lambda (x) (* x x)))


(define ret-sum-sq-largest
  (lambda (a b c)
    (cond ((and (> a b) (> b c)) (+ (square a) (square b)))
          ((and (> b a) (> c a)) (+ (square b) (square c)))
          (else (+ (square a) (square c))))))

(ret-sum-sq-largest -10 -43 5)

(min 1 2 3) ;;; this is a built in procedure

;;; Exercise 1.7

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-sqrt-iter guess x)
  (if (< (/ (abs (- (improve guess x) guess)) guess) 0.0001)
      guess
      (new-sqrt-iter (improve guess x)
                     x)))
(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(new-sqrt 9) 

(sqrt 9)

(define (sqrt-test x)
  (= (new-sqrt x) (sqrt x)))

(sqrt-test 0.001)

(new-sqrt 0.01)

(define (cube-improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

(define (cube-good-enough? guess x)
  (< (abs (- (cube-improve guess x) guess)) 0.0001))

(define (cube-root-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cube-root-iter (cube-improve guess x)
                      x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root -27000)
