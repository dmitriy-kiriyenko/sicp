#lang racket

(require rackunit)

(define (fast-mult a b)
  (define (double x) (+ x x))
  (define (dec x) (- x 1))
  (define (halve x) (/ x 2))
  (define (iter a b c)
    (cond ((= b 0) c)
          ((even? b) (iter (double a) (halve b) c))
          (else (iter a (dec b) (+ c a)))))
  (iter a b 0)
  )

(check-equal? (fast-mult 2 4) 8)
(check-equal? (fast-mult 1234 5678) 7006652)
