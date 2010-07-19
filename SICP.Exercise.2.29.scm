;;; Exercise 2.29

;constructors
(define (make-mobile left right) (list left right))
(define (make-branch length structure) (list length structure))

;selectors
(define (left-branch structure) (car structure))    ;works
(define (right-branch structure) (cadr structure))  ;takes cadr to strip off outside paren
(define (branch-length branch) (car branch))        ;works
(define (branch-structure branch)                   ;works
  (if (not (pair? (cadr branch)))
      (cadr branch)
      (+ (branch-structure (right-branch (cadr branch)))   ;determined to be mobile
         (branch-structure (left-branch (cadr branch))))))  ;cadr to be in normal form
(define (right-branch-weight mobile)
  (total-weight (right-branch mobile)))
(define (left-branch-weight mobile)
  (total-weight (left-branch mobile)))

;procedures
(define (total-weight mobile)                       ;works
  (cond ((null? mobile) 0)
        ((not (pair? (car mobile))) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))   
                 (total-weight (right-branch mobile))))))

;predicates
(define (balanced? mobile)
  (= (* (branch-length (right-branch mobile))
        (right-branch-weight mobile))
     (* (branch-length (left-branch mobile))
        (left-branch-weight mobile))))

;my stuff
(define moby1
  (make-mobile (make-branch 1 4)
               (make-branch 2 2)))
(define moby2
  (make-mobile (make-branch 3 6)
               (make-branch 5 moby1)))

(define moby3
  (make-mobile (make-branch 7 8)
               (make-branch 9 (make-mobile (make-branch 10 11)
                                           (make-branch 12 moby1)))))

(define moby4
  (make-mobile (make-branch 1 moby1)
               (make-branch 1 moby1)))


;If the two constructors were changed, I would have to change individual
;letters in three procedures (cadr ..) to (cdr ..)

;testing, testing
moby1
moby2
moby3
moby4
(left-branch moby4)
(right-branch moby4)

(branch-structure (right-branch moby1))
(branch-structure (left-branch moby1))

(branch-structure (right-branch moby3))

(right-branch moby2)

(cadr (right-branch moby2))

(left-branch (cad

(pair? (cadr (right-branch moby2)))

(left-branch (right-branch moby2))

(pair? (car (cadr moby2)))

(left-branch moby1)
(left-branch moby2)
(right-branch moby1)
(right-branch moby2)
(pair? (car (right-branch (right-branch (right-branch moby3)))))

(branch-length (left-branch moby1))
(branch-length (left-branch moby2))
(branch-structure (right-branch moby1))
(branch-structure (right-branch moby2))

(cadr (right-branch moby2))



(branch-structure (left-branch moby2))

(total-weight moby1)   ;6 correct
(total-weight moby2)   ;12 correct
(total-weight moby3)

(left-branch-weight moby2)  ;6 correct

(balanced? moby4)