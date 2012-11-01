#lang racket

(require rackunit)

(define (fast-mult a b)
  (define (double x) (+ x x))
  (define (dec x) (- x 1))
  (define (halve x) (/ x 2))
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (dec b))))))

(check-equal? (fast-mult 2 4) 8)
(check-equal? (fast-mult 1234 5678) 7006652)
