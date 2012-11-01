#lang racket

(require rackunit)

(define (sqrt x)
  (define (sqrt-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess)
                 guess)))
  (define (good-enough? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0 0.5))

(check < (abs (- (sqrt 4) 2)) 0.001)
(check < (abs (- (sqrt 0.00000001) 0.0001)) 0.001)
(check < (abs (- (sqrt 1000000000000000) 31622776)) 10)