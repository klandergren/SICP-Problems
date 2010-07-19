;;; Exercise 2.32


;this exercise I could not solve on my own. I wrote out a diagram
;of the process and could not make the leap to construct car s and x
;together, although I knew it had to use s as rest just brought up
;empty sets in the base case. 

(define nil (list))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (cons (car s) x))
                      rest)))))

(define t3 (list 1 2 3))

(subsets t3)

(car (list))