;;; Exercise 2.42

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


;testing

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define nil '())

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (make-pair-fun-for x) 
                               (display "hi kip")(display x)(lambda (y) (display "hi sunny") (display y) (list x y)))

(map (lambda (i)           ; make pairs for interval 1 .. i-1
       (map               ; (lambda (j) (list i j))
            (make-pair-fun-for i)
            (list i (- i 1))))          ;enumerate-interval 1 (- i 1))))
     (list 1 2  ))
;     (enumerate-interval 1 1))

(flatmap (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 5))


(car (enumerate-interval 1 1))

(car (list 2 '()))

(cons (list 2 1) '())
(cons (list 3 2)
      (cons (list 3 1)
            '()))
(cons (list 'i 1)
      (cons (list 'i 2)
            '()))
(car (cons (list 'i 1)
      (cons (list 'i 2)
            '())))

(define output1
  (cons (enumerate-interval 1 0)
      (cons (enumerate-interval 1 1)
            (enumerate-interval 1 2))))

(caddr output1)

(define output2
  (cons (list 'i '())
      (cons (list 'i (list 1))
            (cons (list 'i 1)
                  (cons (list 'i (list 2))
                        '())))))

(enumerate-interval 1 0)
