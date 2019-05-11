;1 (binomial N k)
(define (binomial N K)
  (cond 
  ((= N K) 1)
  ((= K 0) 1)
  ((< N K) '(N / A))
  (else (+ (binomial(- N 1) (- K 1)) (binomial(- N 1) K)))
  )
) 
;examples for 1
;(binomial 1 3) 
;(binomial 1 1) 
;(binomial 2 0) 
;(binomial 7 3)

;2 (mod N M)
(define (mod N M)
  (if(< N M)
  N
  (if(= (- N M) 0)
    0
    (mod (- N M) M)
  )
  )
)
;examples for 2
;(mod 2 4)
;(mod 25 7)

;3 (binaryToDecimal b)
;(define (binaryToDecimal b)
(define (binaryToDecimal b)
  (cond 
  ((= b 0) 0)
  (else (+ ( * 2 (binaryToDecimal (/ (- b (mod b 10)) 10))) 
            (mod b 10)))
  )
)
;examples for 3
;(binaryToDecimal 1101) 
;(binaryToDecimal 149286)

;4 (addBinary binaryList)
(define (addBinary binaryList)
  (cond ((null? binaryList) 0)
        (else
         (+ (binaryToDecimal (car binaryList))
            (addBinary (cdr binaryList))))
  )
)
;examples for 4
;(addBinary '(1101 111 10 101)) 
;(addBinary '(11 110001 110 101)) 

;5 (min list)
(define (min lst)
  (cond 
    ((null? (cdr lst)) (car lst))
    ((< (car lst) (min (cdr lst))) (car lst))
    (else (min (cdr lst)))
  )        
)
;(min '(1 2 3))

;6 (myRemove num list)
(define (myRemove num lst)
  (cond
    ((null? lst) '())
    ((= (car lst) num) (myRemove num (cdr lst)))
    (else (cons (car lst) (myRemove num (cdr lst))))
  )
 )
;(myRemove 1 '(2 1 3 1 4))
;(myRemove 5 '(2 1 3 1 4))

;7 (selectionSort list)
(define (selectionSort lst)
  (cond
    ((null? lst) '())
    (else 
    (cons (min (lst)) (selectionSort ((myRemove (min (lst)) lst) )))
    )
  )
)
;not working but this should be the logic
