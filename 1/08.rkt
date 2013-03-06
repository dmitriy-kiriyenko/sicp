#lang racket

(require rackunit)

(define (qbrt x)
  (define (eps) 0.001)
  (define (square x) (* x x))
  (define (qbrt-iter guess prev-guess)
    (define (good-enough?)
      (if (< guess (eps))
          #t
          (< (abs (/ (- guess prev-guess) prev-guess)) (eps))))
    (define (improve)
      (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

    (if (good-enough?)
        guess
        (qbrt-iter (improve)
                   guess)))

  (if (< x 0)
      (- (qbrt (- x)))
      (qbrt-iter 1.0 0.5))
  )

(define (test-eps) 0.001)
(check < (abs (- (qbrt 27) 3)) (test-eps))
(check < (abs (- (qbrt 0.000000001) 0.001)) (test-eps))
(check < (abs (- (qbrt 0) 0)) (test-eps))
(check < (abs (- (qbrt 10000000000000000) 215443)) 10)
(check < (abs (- (qbrt -8) -2)) (test-eps))
(check < (abs (- (qbrt -0.000000001) -0.001)) (test-eps))
(check < (abs (- (qbrt -1) -1)) (test-eps))