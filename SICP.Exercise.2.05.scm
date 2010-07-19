;;; Exercise 2.05

;this is only for integer values > 0

(define (exp base power result)
  (if (= 0 power)
      result
      (exp base (- power 1) (* base result))))

;quick test
(exp 2 3 1)  ;passed

(define (mod-test x y)
  (= (remainder x y) 0))

;quick-test
(mod-test 17 2) ;passed

(define (find-3b x)   ;find the base 3^b
  (if (mod-test x 2)
      (find-3b (/ x 2))
      x))

;quick-test
(find-3b 36) ;passed

(define (find-2a x)  ;find the base 2^a
  (if (mod-test x 3)
      (find-2a (/ x 3))
      x))

;quick-test
(find-2a 36) ;passed

(define (get-base-two x)
  (define (iter num counter)
    (if (= num 1)
        counter
        (iter (/ num 2) (+ counter 1))))
  (iter x 0))

;quick test
(get-base-two 8)  ;passed


(define (get-base-three x)
  (define (iter num counter)
    (if (= num 1)
        counter
        (iter (/ num 3) (+ counter 1))))
  (iter x 0))

;quick test
(get-base-three 9)  ;passed

(define (cons a b)
  (* (exp 2 a 1)
     (exp 3 b 1)))

(define (car x)
  (get-base-two (find-2a x)))

(define (cdr x)
  (get-base-three (find-3b x)))


;test
(cons 98 63)   
(car 362725946315646935826523893473499659271420817997046258597888)  ;98 
(cdr 362725946315646935826523893473499659271420817997046258597888)  ;36
(car (cons 65 34)) ;65

