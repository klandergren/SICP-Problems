;;; Exercise 2.20

;On second thought, I should have written e-n-r-l and o-n-r-l with reverse
;incorporated so they would be more useful.


(define (even? n)
  (= (remainder n 2) 0))

;takes a list and outputs a reversed even list
(define (even-num-reversed-list l)
  (define (iter original outputlist)
    (cond ((null? original) outputlist)
          ((even? (car original)) (iter (cdr original)
                                        (append (list (car original))
                                                outputlist)))
          (else (iter (cdr original) outputlist))))
  (iter l (list)))

;takes a list and outputs a reversed odd list
(define (odd-num-reversed-list l)
  (define (iter original outputlist)
    (cond ((null? original) outputlist)
          ((not (even? (car original))) (iter (cdr original)
                                        (append (list (car original))
                                                outputlist)))
          (else (iter (cdr original) outputlist))))
  (iter l (list)))

;reverses a list
(define (reverse l)
  (define (iter original reversed)
    (if (null? original)
        reversed
        (iter (cdr original)
              (append (list (car original)) ;**
                      reversed))))
  (iter l (list)))

(define (same-parity key . rest)
  (if (even? key)
      (append (list key) (reverse (even-num-reversed-list rest)))
      (append (list key) (reverse (odd-num-reversed-list rest)))))



(define testlist (list 1 2 3 4 5 6))

(even-num-reversed-list testlist) ;works
(odd-num-reversed-list testlist) ;works
(reverse testlist) ;works
(same-parity 1 2 3 4 5 6 7) ;huzzah
(same-parity 2 3 4 5 6 7)   ;huzzah
      