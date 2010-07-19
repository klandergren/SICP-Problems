;;; Exercise 2.33

;test data
(define l1 (list 9 8 7 6 5 4 3 2 1))
(define l2 (list 1 4 6 2 5 8 9 6 23 7 33 3 8 45 7 3 12 56 90 65 34 21))
(define l3 (list 1 2))
(define l4 (list 3 4))

(define nil (list))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;procedures

(define (length-helper x y)   ;this normalizes first arg, and adds to second
  (+ (/ x x)
     y))

(define (map p sequence)        ;yahhh baby this works
  (accumulate (lambda (x y)
                (cons (p x)
                      y))
              nil
              sequence))

(define (append seq1 seq2)       ;works
  (accumulate cons seq2 seq1))

(define (length sequence)                 ;works
  (accumulate length-helper 0 sequence))


;an alternative (better) form of length is
(define (alt-length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))  ;ignores the first input variable x



;testing
(map square l1)  ;works:(81 64 49 36 25 16 9 4 1)
(append l3 l4)   ;works: (1 2 3 4)
(length l1)      ;works: 9
(alt-length l1)  ;works: 9
