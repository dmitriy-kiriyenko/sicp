#lang racket

(require rackunit)

(define (sum-of-biggest-squares x y z)
  (define (square a)  (* a a))
  (define (sum-of-squares a b)
    (+ (square a) (square b)))
  (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))
   ))

(check-equal? (sum-of-biggest-squares 1 2 3) 13)
(check-equal? (sum-of-biggest-squares 3 2 1) 13)
(check-equal? (sum-of-biggest-squares 2 2 2) 8)
(check-equal? (sum-of-biggest-squares 1 0 0) 1)