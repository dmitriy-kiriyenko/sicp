#lang racket

(require rackunit)

(define (pascal a b)
  (define (first? x y) (or (= x 1) (= y 1)))
  (define (prev x) (- x 1))
  (if (first? a b)
      1
      (+ (pascal (prev a) b) (pascal a (prev b)))
  ))

(check-equal? (pascal 1 1) 1)
(check-equal? (pascal 5 5) 70)