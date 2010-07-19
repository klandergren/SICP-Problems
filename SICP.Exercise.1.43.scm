;;; Exercise 1.43

(define (square x)
  (* x x))

(define (identity x) x)

;this composition function takes two procedures as arguments
;and implemetns x --> f1(f2(x))
(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))


;;;
(define (repeated1 proc)
  (compose proc proc))

((repeated1 square) 5)
;;; ^this worked in its handicap form


;;;
(define (repeated2 proc n)
  (if (= n 0)
      proc
      (compose (repeated2 proc (- n 2)) proc)))

((repeated2 square 2) 5)
;;;^this worked but only for evens


(define (repeated3 proc n)
  (cond ((= n 0) proc)
        ((even? n) (compose proc (repeated3 proc (- n 2))))
        (else (compose (repeated3 proc (- n 1)) identity))))

((repeated3 square 3) 5)


(define (repeated4 proc n)
  (cond ((= n 0) proc)
        ((= n 1) proc)
        (else (compose proc (repeated4 proc (- n 1))))))

((repeated4 square 4) 5) ;;huzzah this works



