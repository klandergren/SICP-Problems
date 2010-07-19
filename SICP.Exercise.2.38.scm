;;; Exercise 2.38

(define nil '())

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3)) ;3/2
(fold-left / 1 (list 1 2 3))  ;1/6
(fold-right list nil (list 1 2 3)) ;guess: ((1) (2) (3)) actual: (1 (2 (3 ())))
(fold-left list nil (list 1 2 3))  ;guess (((() 1) 2) 3) correct


;guess append and test
(fold-right append nil (list 1 2 3))
(fold-lefit append nill (list 1 2 3))
;fail

;guess any operation where order doesn't matter (associative?) like +
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
;win


