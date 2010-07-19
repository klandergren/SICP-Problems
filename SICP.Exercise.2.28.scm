;;; Exercise 2.28

(define x (list (list 1 2) (list 3 4)))  ; ((1 2) (3 4))

(define t1 (list 1 2 3 4 5))
(define t2 (list (list 1 2) (list 3 (list 4 5)))) ;
t2

;(define (map proc items)
;  (if (null? items)
;      items
;      (cons (proc (car items))
;            (map proc (cdr items)))))


(map (lambda (x) (* x x)) t1)

(define (map-append items)
  (if (or (null? items) (pair? items))
      items
      (append (car items)
              (map-append (cdr items)))))

(define (map-append items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (cons (car items)
                             (map-append (cdr items))))
        (else items)))

(if (and (pair? x) (null? (cdr x)))
    (car x))

(cond ((and (pair? x) (null? (cdr x))) (append current-list
                                               (list (my-func (car x) current-list))))
      ((

       )))

(define (fringe t)
  (cond ((null? t) t)
        ((not (pair? t)) (list t))
        (else (append (fringe (car t))
                      (fringe (cdr t))))))

(fringe x)
;this took me stupidly long to get (glacial pace) but i got it.
;ignore all below.


          ((and (pair? t) (null? (cdr t))) (append (list (car t)) l))
          ((null? t) t)
          (else (fringe-helper (car t) l
          
(append (list 1) (list 2) (list 3) (append (list 3 4) (list 2)) 6)

(cdr (list (list (list 2) 3 5)))     ;()
(list (list (list 2) 3 5))           ;(((2) 3 5))
(append (list (list (list 2) 3 5)) (list 3))

(car (list (list (list 3 4) 5) 6))
(cddr (list (list (list 3 4) 5) 6))
(append (append (list 3 4) () (list 1))
(cons (cons (list 3 4) (list 5)) (list 1))

(pair? (cdr x))
(cddr t2) 
(pair? ())   ;F
(pair? 1)    ;F
(map-append x)


(cons (cons 1 2) 3)
(cons (cons 1 (cons 4 3)) (list 1 2))

(define (fringe tree)
  (if (pair? tree)
      (map map-append tree)
      tree))

(fringe x)

(define y (cons (list 1) (list 2 (list 2 3))))

y

(define z (append (list 1) (list 3)))

z

(cons 1 (list 2 3))
(cons (list 1) (list 2 3))
(list 1 (list 2 3))

;notes
;map needs a one dimensional list?


            