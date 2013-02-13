#lang racket

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (define (square x)
      (* x x))
    (define (divides? a b)
      (= (remainder b a) 0))
    (cond((> (square test-divisor) n) n) 
         ((divides? test-divisor n) test-divisor) 
         (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(define (odd? n)
  (= (remainder n 2) 1))

(define (prime? n) 
  (and (not (odd? n))
       (= n (smallest-divisor n))))

(define (runtime)
  (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  true)

(define (search-for-primes start-num count)
  (if (< 0 count)
      (if (timed-prime-test start-num)
          (search-for-primes (+ start-num 1) (- count 1))
          (search-for-primes (+ start-num 1) count))
      false))