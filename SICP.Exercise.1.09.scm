;;; Exercise 1.9

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;;; this processes is linearly recursive keeping track of
;;; the number of 'inc' the processes grows with

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
;;; This process is linear iterative (just keeps track of
;;; variables a and b
