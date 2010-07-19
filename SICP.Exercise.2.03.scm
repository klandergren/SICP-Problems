;;; Exercise 2.03

;The code below assumes that you correclty input a rectangle who's bottom edge
;is parallel to the x axis and not some funky one at an angle.

;The second part of the exercise is trying to get you to put the data structure
;that represents rectangle, either from make-rectangle1 or make-rectangle2
;into the same form, so that area and perim can be called regardless of make


;constructors
(define (make-point x y)
  (cons x y))
(define (make-rectangle1 x1 y1 height length)    ;goal is to put the data form rectangle
  (cons (cons (make-point x1 y1)                 ;into the same form as make-rectangle2
              (make-point (+ x1 length) y1))
        (cons (make-point (+ x1 length) (+ y1 height))
              (make-point x1 (+ y1 height)))))
(define (make-rectangle2 x1 y1 x2 y2 x3 y3 x4 y4)  ;no check to see if points correspond
  (cons (cons (make-point x1 y1)                   ;to actual locations on rectangle
              (make-point x2 y2))                  
        (cons (make-point x3 y3)
              (make-point x4 y4))))

;selectors
(define (get-bl-point rect)  ;returns bottom left point
  (car (car rect)))
(define (get-br-point rect)  ;returns bottom right point
  (cdr (car rect)))
(define (get-tl-point rect)
  (cdr (cdr rect))) ;returns top left point
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))
(define (get-length rect)                 
  (abs(- (x-point(get-br-point rect))
         (x-point(get-bl-point rect)))))
(define (get-height rect)                 
  (abs(- (y-point(get-tl-point rect))
         (y-point(get-bl-point rect)))))

;procedures
(define (print-ap rect)   ;prints output of area and perim
  (newline)
  (display "(Area: ")
  (display (area rect))
  (display ", Perimeter: ")
  (display (perim rect))
  (display ")"))
(define (area rect)       ;finds the area of rect, regarless of make-
  (let ((l (get-length rect))
        (h (get-height rect)))
    (* l h)))
(define (perim rect)      ;finds the perim of rect, regardless of make-
  (let ((l (get-length rect))
        (h (get-height rect)))
    (* 2 (+ l h))))


;my rectangles!
(define mine1 (make-rectangle1 0 0 1 2))
(define mine2 (make-rectangle2 0 0 2 0 2 1 0 1))
(define mine3 (make-rectangle1 0 0 3 4))
(define mine4 (make-rectangle2 0 0 4 0 4 3 0 3))



;see if it works?
(define (test-recs rect1 rect2)
  (begin (print-ap rect1)    
         (print-ap rect2)))

(test-recs mine1 mine2)
(test-recs mine3 mine4)



