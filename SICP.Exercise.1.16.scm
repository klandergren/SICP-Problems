;;; Exercise 1.16

; I got really frustrated with this exercise,
; and had to look up the solution. more notes
; below.

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

; Post Solution notes:
; The key to the following procedure
; is to not neglect the ability to
; do calculations outside of 'a'
; In this case we're doing squaring
; and storing it in 'b' and taking
; care of the odd numbered n with a

; In my original attempt I was trying
; to make all squaring through a. This
; was mostly because I didn't apply/understand
; the hint.

(define (fei-iter b n a)
  (cond ((<= n 0) a)
        ((even? n) (fei-iter (square b) (/ n 2) a))
        (else (fei-iter b (- n 1) (* a b)))))

(define (fast-expt-iterative b n)
  (fei-iter b n 1))

;;testing

(fast-expt-iterative 2 9)

;;;I'm having a lot of trouble figuring out the solution
;;;to the above, I think I have the first and third
;;;conditions correct, but not the second. therefore I'm
;;;testing a factorial-iter to see if i understand how
;;;to build an iterative procedure..
;;;note: the below code works

(define (factorial-iter n product)
  (if (= n 0)
      product
      (factorial-iter (- n 1) (* n product))))
(define (factorial n)
  (factorial-iter n 1))

(factorial 1456)  ;this agrees with wolframalpha's output