;;; Exercise 2.27

(define x (list (list 1 2) (list 3 4)))

(define t1 (list 1 2))            ;(1 2)
(define t2 (list 1 2 3))          ;(1 2 3)
(define t3 (list 1 (list 2 3)))   ;(1 (2 3))
(define t4 (list (list 3 4)))     ;((3 4))

;starting from scratch to make sure I know it cold
(define (reverse x)
  (define (iter x newlist)
    (if (null? x)
        newlist
        (iter (cdr x) (cons (car x) newlist))))
  (iter x (list)))

(reverse t1)

;find a pair, then reverse-deep on the head and tail using map
;to drill farther down. then make sure to reverse the output of
;map with reverse
(define (reverse-deep x)
  (if (pair? x)
      (reverse (map reverse-deep x))
      x))

(reverse t4)
(reverse-deep t4)

(reverse t3)
(reverse-deep t3)



;testing

(define x (list (list 1 2) (list 3 4)))  ; ((1 2) (3 4))
