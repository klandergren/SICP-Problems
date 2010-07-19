;;; Exercise 2.21

(define testlist (list 1 2 3 4 5 6))

(define (square x)
  (* x x))

(define (square-list1 items)
  (if (null? items)
      items
      (cons (square (car items))
            (square-list1 (cdr items)))))

(square-list1 testlist)

(define (square-list2 items)
  (map square items))

(square-list2 testlist)