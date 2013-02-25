#lang racket

(require rackunit)

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (sqrt-iter guess prev-guess)
    (define (good-enough?)
      (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))
    (define (improve)
      (average guess (/ x guess)))
    (if (good-enough?)
      guess
      (sqrt-iter (improve)
                 guess)))
  (if (= x 0)
      0
      (sqrt-iter 1.0 0.5))
  )

(check < (abs (- (sqrt 4) 2)) 0.001)
(check < (abs (- (sqrt 0.00000001) 0.0001)) 0.001)
(check < (abs (- (sqrt 0) 0)) 0.001)
(check < (abs (- (sqrt 1000000000000000) 31622776)) 10)