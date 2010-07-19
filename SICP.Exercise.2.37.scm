;;; Exercise 2.37

;env

(define nil '())

;test values
(define m1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define m2 (list (list 2 2 2 2) (list 2 2 2 2) (list 2 2 2 2)))
(define v1 (list 2 2 2 2))
(define w1 (list 3 3 3 3))


;procedures

(define (identity x) x)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))    
            (accumulate-n op init (map cdr seqs)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (dot-product v w)        ;works if you clear strict map from env (how?)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)    ;works
  (map (lambda (x)
         (dot-product v x)) m))

(define (transpose mat)          ;works
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)    ;works
  (let ((cols (transpose n)))
    (map (lambda (m-row)
           (matrix-*-vector cols m-row))
         m)))



;testing
(map (lambda (x) (cons 2 x)) m1)
(dot-product v1 w1)
(matrix-*-vector m1 v1)
(car m1)
(identity 3)
(transpose m1)
(map cdr m1)
(cdr m1)
(matrix-*-matrix m1 (transpose m2))
(matrix-*-vector (transpose m2) (list 1 2 3 4))
(accumulate-n + 0 (car m1))

m1
(transpose m1)

(transpose m2)
m2