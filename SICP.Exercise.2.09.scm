;;; Exercise 2.09

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))


;my functions
(define (upper-bound i)
  (let ((a (car i))
        (b (cdr i)))
    (max a b)))
(define (lower-bound i)
  (let ((a (car i))
        (b (cdr i)))
    (min a b)))
(define (sub-interval x y)
  (let ((l1 (- (lower-bound x) (lower-bound y)))
        (l2 (- (lower-bound x) (upper-bound y)))
        (m1 (- (upper-bound x) (upper-bound y)))
        (m2 (- (upper-bound x) (lower-bound y))))
    (make-interval (min l1 l2)
                   (max m1 m2))))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(define in1 (make-interval 3 4))
(define in2 (make-interval 6 10))

(define subi (sub-interval in1 in2))
(define addi (add-interval in1 in2))
(define multi (mul-interval in1 in2))
(define divi (div-interval in1 in2))

(width in1)  ; 1/2
(width in2)  ; 2

(width subi) ; 5/2
(width addi) ; 5/2
(width multi); 11
(width divi) ; 0.18333

