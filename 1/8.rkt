#lang racket

(require rackunit)

(define (qbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (qbrt-iter (improve guess x)
                 guess
                 x)))

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (qbrt x)
  (qbrt-iter 1.0 0.5 x))

(check < (abs (- (qbrt 27) 3)) 0.001)
(check < (abs (- (qbrt 0.000000001) 0.001)) 0.001)
(check < (abs (- (qbrt 10000000000000000) 215443)) 10)