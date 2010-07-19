;;; Exercise 1.20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

;; Evaluating (gcd 206 40) using normal-order evaluation
;; to find number of times 'remainder' is called
;;
;; Applicative-Order:
;; (gcd 206 40) --> (gcd 40 (remainder 206 40))
;; #1
;; (gcd 40 6)   --> (gcd 6 (remainder 40 6)
;; #2
;; (gcd 6 4)    --> (gcd 4 (remainder 6 4)
;; #3
;; (gcd 4 2)    --> (gcd 2 (remainder 4 2)
;; #4
;; (gcd 2 0)    --> 2
;; 'remainder' is called 4 times


;; Normal Order:

;; Step 1

(gcd 206 40)
(if (= 40 0)
    40
    (gcd 40 (remainder 206 40)))

;; remainder count = 0

;; Step 2

(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

;; remainder count = 0

;; Step 3
;; evaluate if predicate

(gcd 40 (remainder 206 40))
(if (= 6 0) ;where remainder is processed
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

;;;Question: Why does a normal-order evaluation not
;;;          just continue with the (gcd (remainder..)
;;;          procedures and evaluate the if predicate
;;;          at the end?
;;;          This is why I thought it would be an
;;;          infinite loop. This current solution is
;;;          thinking of the evaluation in 'snapshots'
;;;          even if this isn't exactly how the compiler
;;;          processes it.

;; remainder count = 1

;; Step 4
    
(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))

;; remainder count = 1

;; Step 5

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
(if (= (remainder 40 6) 0) ; where remainder is processed
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))

;; remainder count = 2

;; Step 6

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
(if (= 4 0) ; where remainder is processed
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))

;; remainder count = 3

;; Step 7

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 206 40)
                  (remainder 40 (remainder 206 40)))
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
        

;; remainder count = 3

;; Step 8

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 206 40)
                  (remainder 40 6));here
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
        

;; remainder count = 4

;; Step 9

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 206 40)
                  4);here
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
        

;; remainder count = 5

;; Step 10

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))))
(if (= (remainder 6 ;here
                  4)
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
        

;; remainder count = 6

;; Step 11

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))))
(if (= 2 ;here
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
        

;; remainder count = 7

;; Step 12

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))
       0)
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 7

;; Step 13

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 6))) ;here
       0)
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 8

;; Step 14

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             4)) ;here
       0)
    (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 9

;; Step 15

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder 6 ;here
                             4)) 
       0)
    (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 10

;; Step 16

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 6) ;here
                  (remainder 6 
                             4)) 
       0)
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 11

;; Step 17

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 6)
                  2); here 
       0)
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 12

;; Step 18

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder 4 ;here
                  2) 
       0)
    (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 13

;; Step 19

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= 0 ;here 
       0)
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder ((remainder (remainder 206 40)
                                (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40)
                                           (remainder 40 (remainder 206 40))))))))
    

;; remainder count = 14

;; Step 20

;; because (= 0 0), count remaining 'remainder' statements in consequent
;; which is 4, so
;; remainder count = 18