#lang racket

(require rackunit)

(define (qbrt x)
  (define (square x) (* x x))
  (define (qbrt-iter guess prev-guess)
    (define (good-enough?)
      (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))
    (define (improve)
      (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

    (if (good-enough?)
        guess
        (qbrt-iter (improve)
                   guess)))

  (if (< x 1e-120)
      x
      (qbrt-iter 1.0 0.5))
  )

(check < (abs (- (qbrt 27) 3)) 0.001)
(check < (abs (- (qbrt 0.000000001) 0.001)) 0.001)
(check < (abs (- (qbrt 0) 0)) 0.001)
(check < (abs (- (qbrt 10000000000000000) 215443)) 10)