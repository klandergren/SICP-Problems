;;; Exercise 2.31

(define (tree-map proc tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define (square-tree tree)
  (tree-map square tree))

(define (blah tree)
  (tree-map (lambda (x) (* x x x)) tree))

(blah t1) ;aint that right B-)