;;;Exercise 1.19

;;Post-exercise Notes
;;the only computation difficulty in this exercise
;;is rearranging the variables properly.
;;my recommendation is to start by solving
;;b' by arranging terms by b and a.
;;this is easier than starting with a' because
;;there are two a terms in a'

;;Conceptually, I'm not following how
;;the second transformation of Tpq
;;set to Tp'q' allows us to reduce
;;the count by half.

(define (even? x)
  (= (remainder x 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q)
                      (* p p))
                   (+ (* q q)
                      (* 2 (* p q)))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 6)

 