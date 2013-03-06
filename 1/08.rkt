#lang racket

(require rackunit)

(define (qbrt x)
  (define (eps) 0.001)
  (define (small-eps) 1e-6)
  (define (square x) (* x x))
  (define (qbrt-iter guess prev-guess)
    (define (good-enough?)
      (< (abs (- guess prev-guess)) (abs (* guess (eps)))))
    (define (small-enough?)
      (< (abs guess) (small-eps)))
    (define (average3 a b c) (/ (+ a b c) 3))
    (define (improve)
      (average3 (/ x (square guess)) guess guess))

    (if (or (good-enough?) (small-enough?))
        guess
        (qbrt-iter (improve)
                   guess)))

  (qbrt-iter 1.0 x)
  )

(define (test-eps) 0.001)
(check < (abs (- (qbrt 27) 3)) (test-eps))
(check < (abs (- (qbrt 0.000000001) 0.001)) (test-eps))
(check < (abs (- (qbrt 0) 0)) (test-eps))
(check < (abs (- (qbrt 10000000000000000) 215443)) 10)
(check < (abs (- (qbrt -8) -2)) (test-eps))
(check < (abs (- (qbrt -0.000000001) -0.001)) (test-eps))
(check < (abs (- (qbrt -1) -1)) (test-eps))