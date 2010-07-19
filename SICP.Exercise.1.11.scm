;;; Exercise 1.11

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(f-recursive 4)

(define (f-iterative n)
  (define (get-product y1 y2 y3 counter)
    (if (< counter 3)
        counter
        (+ y1 (* 2 y2) (* 3 y3))))
  (define (f-iter y1 y2 y3 counter)
    (if (= counter n)
        (get-product y1 y2 y3 counter)
        (f-iter (get-product y1 y2 y3 counter)
                y1
                y2
                (+ counter 1))))
    (f-iter 0 0 0 0))

(f-iterative 7)
(f-recursive 5)
                


                   