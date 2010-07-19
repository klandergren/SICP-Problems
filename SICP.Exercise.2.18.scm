;;; Exercise 2.18

(define (reverse l)
  (define (iter original reversed)
    (if (null? original)
        reversed
        (iter (cdr original)
              (append (list (car original)) ;**
                      reversed))))
  (iter l (list)))

(define zed (list 1 4 9 16 25))

(reverse zed) ;works


;note that car returns a numer not a list hence **
      