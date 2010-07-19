;;; Exercise 2.07


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


;testing
(define my-interval (make-interval 4 3))

(lower-bound my-interval)  ;correct 
(upper-bound my-interval)  ;correct

