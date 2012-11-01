#lang racket

(require rackunit)

(define (fast-expt b n)
  (define (square x) (* x x))
  (define (half x) (/ x 2))
  (define (dec x) (- x 1))
  (define (iter a b n )
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (half n)))
          (else (iter (* a b) b (dec n)))))
  (iter 1 b n))

(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt 2 10) 1024)
(check-equal? (fast-expt 3 20) 3486784401)