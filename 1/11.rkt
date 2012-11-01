#lang racket

(require rackunit)

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (f-rec (- n 2))
         (f-rec (- n 3))))
  )

(define (f-iter n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter (+ a b c) a b (- count 1)))
    )
  (iter 2 1 0 n)
  )

(check-equal? (f-rec 30) 45152016)
(check-equal? (f-iter 30) 45152016)