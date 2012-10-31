#lang racket

(require rackunit)

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 0.5 x))

(check < (abs (- (sqrt 4) 2)) 0.001)
(check < (abs (- (sqrt 0.00000001) 0.0001)) 0.001)
(check < (abs (- (sqrt 1000000000000000) 31622776)) 10)