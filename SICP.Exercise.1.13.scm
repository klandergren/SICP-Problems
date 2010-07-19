;;; Exercise 1.13

;;; For Proof, see notes

; Question:
; Why does the following code's steps grow
; as theta( phi^n ) and not theta( phi^(n+1) )?
; Where phi = (1 + sqrt(5))/2 (golden ratio)

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; Thoughts:
; (fib n) requires (fib n+1) calculations of (fib 1) or (fib 0)
; Position    Fib #    Steps
;   0          0         1
;   1          1         1
;   2          1         3
;   3          2         5     Note: is steps = 4 or = 5?
;   4          3         8     
;   n       (fib n)    (fib n+1)

(fib 2)