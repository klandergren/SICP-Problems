;;; Exercise 2.17

(define (last-pair l)
  (define (f scratchlist lastposition)
    (if (null? scratchlist)
        lastposition
        (f (cdr scratchlist) scratchlist)))
  (f l (list)))

(define blah (list 23 72 149 34 68))

(last-pair blah) ;it works

