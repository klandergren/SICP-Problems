;;; Exercise 2.35

(define t2 (list (list 1 2) (list 3 (list 4 5))))
t2  ;((1 2) (3 (4 5)))

(define nil (list))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define (count-leaves1 t)   ;this doesn't use map as rec'd by the book
  (accumulate (lambda (x y) (+ (if (not (pair? x))
                                   1
                                   (count-leaves1 x))
                               y))
              0
              t))

(define (count-leaves2 t)   ;not my code, but another way to do it
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree t))))

(define (count-leaves3 t)   ;not my code, but does it without enumerate-tree
  (accumulate +
              0
              (map (lambda (node) (if (pair? node)
                                      (count-leaves3 node)
                                      1))
                   t)))


;testing
(count-leaves1 t2) ;works 5
(count-leaves2 t2) ;works 5
(count-leaves3 t2) ;works 5

(car t2)  ;(1 2)
(cdr t2)  ;((3 (4 5)))


(define (tester t)
  (map (lambda (node)
         (if (pair? node)
             (tester node)
             1))
       t))

(tester t2)  ;outputs ((1 1) (1 (1 1)))