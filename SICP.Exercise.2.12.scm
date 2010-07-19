;;; Exercise 2.12


(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;constructor for center c and percent tolerance per
(define (make-center-percent c per)
  (let ((mag (/ (* c per) 100)))
    (make-center-width c mag)))


;Selector
(define (get-percent i)
  (* (/ (- (center i) (lower-bound i))
        (center i))
     100))

;testing
(define in3 (make-center-percent 3 15))

(get-percent in3)
(center in3)
(lower-bound in3)

