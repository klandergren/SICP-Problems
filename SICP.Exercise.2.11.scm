;;; Exercise 2.11


;;skipping for now

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

(define (check-zero? i)
  (and (> 0 (lower-bound i)) (< 0 (upper-bound i))))

(define (div-interval x y)
  (if (check-zero? y)
      (display "Error..Divied by 0...Creating Black Hole...")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

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

(define in1 (make-interval -2 4))
(define in2 (make-interval 6 10))

(div-interval in2 in1)
