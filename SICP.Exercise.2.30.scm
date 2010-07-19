;;; Exercise 2.30

(define (square-tree1 tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree1 (car tree))
                    (square-tree1 (cdr tree))))))


(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree2 sub-tree)
             (square sub-tree)))
       tree))

(define (scale-tree tree factor)
  (map (lambda (x)                 ;i don't quite follow whats going on here
         (if (pair? x)
             (scale-tree x factor)
             (* x factor)))
       tree))

(scale-tree t1 2)

(define t1
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

t1
(square-tree1 t1)
(square-tree2 t1)


