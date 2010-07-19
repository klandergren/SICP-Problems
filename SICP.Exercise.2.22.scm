;;; Exercise 2.22

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items (list)))

;;; In this first function cons attaches (proc (car list)) to the empty
;;; list 'answer', which on the next iteration will have value (car list)
;;; of the previous iteration. This creates a cons like:
;;; (1 2 3 4) ==> (2 3 4) cons (1 ()) ==> (3 4) cons (2 (1 ())) etc etc

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items (list)))

;;; by changing the order of cons args Louis is constructing a list that
;;; is built backwards: car answer returns (((().1).4).9).16) with
;;; (cdr answer) = 25


;testing
(cons 1 (list 1 2))
(cons 1 2)
(cons 2 (cons (list) (list 1)))
(cons 3 (cons 2 (cons (list) (list 1))))
(define mylist (list 1 2 3 4 5))
(square-list1 mylist)
(define test (square-list2 mylist))

(caar test)
