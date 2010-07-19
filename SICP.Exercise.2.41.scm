;;; Exercise 2.41

(define (ordered-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))  ;was orig flatmap
                                 (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;testing
(ordered-triples 5)


;not my code
(define (unique-triples n) 
   (flatmap (lambda (i) 
              (flatmap (lambda (j) 
                         (map (lambda (k) (list i j k)) 
                              (enumerate-interval 1 (- j 1)))) 
                       (enumerate-interval 1 (- i 1)))) 
            (enumerate-interval 1 n)))

(unique-triples 5)
