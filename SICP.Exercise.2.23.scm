;;; Exercise 2.23

;;for-each2 is not my code, but it seems that we both generate the same
;;errors. Will come back to this. 

(define (for-each proc list)
  (let ((rest (cdr list)))
    (proc (car rest))
    (if (null? rest)
      true
      (for-each proc (cdr rest)))))

(define (for-each2 proc items) 
   (let ((items-cdr (cdr items))) 
     (proc (car items)) 
     (if (not (null? items-cdr)) 
         (for-each proc items-cdr) 
         true))) 

(for-each2 (lambda (x) (newline) (display x))
          (list 57 321 88))


;how do you define a variable using for-each?
(for-each (lambda (x) (newline) (display (* x x)))
          (list 1 2 3))



