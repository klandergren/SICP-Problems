;;; Exercise 2.39

(define sequence1 (list 1 2 3))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(define (reverse sequence)   ;works
  (fold-right (lambda (x y)
                (append y
                        (list x)))
              nil
              sequence))

(define (reverse sequence)   ;works
  (fold-left (lambda (x y)
               (cons y
                     x))
             nil
             sequence))


(reverse sequence1)