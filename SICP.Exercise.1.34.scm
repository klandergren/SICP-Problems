;;;Exercise 1.34

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

;Ask the interpreter to evaluate (f f) and explain

;I think it will throw the same error as if you had
;inputted (2 2)

(f f)