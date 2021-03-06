#lang racket

(define (count-change amount)
  (define (make-node amount kinds-of-coins left right)
    (list amount kinds-of-coins left right))

  (define (make-leaf amount)
    (list amount))
  
  (define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))
  
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) (make-leaf 1))
          ((or (< amount 0) (= kinds-of-coins 0)) (make-leaf 0))
          (else (make-node amount
                        kinds-of-coins
                        (cc amount
                            (- kinds-of-coins 1))
                        (cc (- amount (first-denomination kinds-of-coins))
                            kinds-of-coins)))))
  
  (cc amount 5))

(count-change 11)