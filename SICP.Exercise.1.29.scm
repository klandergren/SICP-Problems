;;; Exercise 1.29

(define (cube x)
  (* x x x))

(define (simpson-integral f a b n)
  (define h-num
    (/ (- b a) n))
  (define (yk k)
    (f (+ a (* k h-num))))
  (define (simpson-inside k)
    (if (> k n)
        0
        (+ (* 2 (yk k))
           (* 4 (yk (+ k 1)))
           (simpson-inside (+ k 2)))))
  (* (/ h-num 3)
     (+ (f a) ;this is y0
        (simpson-inside 1))))

;Second Try

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (si2 f a b n)
  (define h
    (/ (- a b) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (si-inside k)    ;give me kth si-inside term
    (* (y k)
       (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))))
    (* (/ h 3)
     (sum si-inside 0 inc n)))


;internet's results
(define (si3 f a b n)
  (define (do-it h)
    (define (y k) 
      (f (+ a (* k h))))
    (define (simpson-term k)
      (* (y k) 
         (cond ((or (= k 0) (= k n)) 1)
               ((odd? k) 4)
               (else 2))))
    (* (/ h 3) (sum simpson-term 0 inc n)))
  (do-it (/ (- b a) n)))

(newline)
(newline)
(newline)
(simpson-integral cube 0 1 100)
(si2 cube 0 1 100)
(si3 cube 0 1 100)
(simpson-integral cube 0 1 1000)
(si2 cube 0 1 1000)
(si3 cube 0 1 1000)