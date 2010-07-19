;;; Exercise 2.02

;constructors
(define (make-segment x1 y1 x2 y2)
  (cons (make-point x1 y1)
        (make-point x2 y2)))
(define (make-point x y)
  (cons x y))

;selectors
(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;procedures

;takes a line segment as arg
(define (midpoint-segment seg)
  (let ((mx (/ (+ (x-point (start-segment seg))
                  (x-point (end-segment seg)))
               2))
        (my (/ (+ (y-point (start-segment seg))
                  (y-point (end-segment seg)))
               2)))
    (let ((p (make-point mx my)))    
      (print-point p))))
;the key to solving the above is my including the second let in
;the body of the first.
;Notes: let does not allow current variables to be expressed
;in terms of those that are currently defined unless in the
;body as shown above.

;prints out the point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;my line segment
(define mine (make-segment 0 1 1 0))

;see if it works?
(midpoint-segment mine) ;;yeahhh buddyy

         