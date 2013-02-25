#lang racket

(require rackunit)

(define (sum-of-biggest-squares x y z)
  (define (square a)  (* a a))
  (define (sum-of-squares a b)
    (+ (square a) (square b)))
  (define a (if (> x y) x y))
  (define b (if (< x y) x y))
  (define c (if (> y z) y z))
  (sum-of-squares a c)
  )

(check-equal? (sum-of-biggest-squares 1 2 3) 13)
(check-equal? (sum-of-biggest-squares 3 2 1) 13)
(check-equal? (sum-of-biggest-squares 2 2 2) 8)
(check-equal? (sum-of-biggest-squares 1 0 0) 1)