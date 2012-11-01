#lang racket

(require rackunit)

(define (qbrt x)
  (define (qbrt-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
        guess
        (qbrt-iter (improve guess)
                   guess)))

  (define (good-enough? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

  (define (square x) (* x x))

  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

  (qbrt-iter 1.0 0.5))

(check < (abs (- (qbrt 27) 3)) 0.001)
(check < (abs (- (qbrt 0.000000001) 0.001)) 0.001)
(check < (abs (- (qbrt 10000000000000000) 215443)) 10)