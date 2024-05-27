; You are given the following piece of code that analyzes a 5-digit
;number, between 10000 and 99999 where all digits are different:

(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)

(declare-const num Int)
(declare-const num1 Int)

(declare-const security Int)

(declare-const add1 Int)
(declare-const add2 Int)
(declare-const add3 Int)
(declare-const add4 Int)

(assert (and (> a 0) (<= a 9)))
(assert (and (>= b 0) (<= b 9)))
(assert (and (>= c 0) (<= c 9)))
(assert (and (>= d 0) (<= d 9)))
(assert (and (>= e 0) (<= e 9)))

(assert (= num (+ (* 10000 a) (* 1000 b) (* 100 c) (* 10 d) e)))
(assert (= security 4))
(assert (= add1 (ite (xor (= 0 (mod num 3)) (= 0 (mod num 5))) 1 0)))
(assert (= add2 (ite (= 0 (mod (+ a b c d e ) 10)) 1 0 )))
(assert (= num1 (+ (* 10000 e) (* 1000 d) (* 100 c) (* 10 b) a)))
(assert (= add3 (ite (= num num1) 1 0 )))
(assert (= add4 (ite (and (<= a b) (<= b c) (<= c d) (<= d e)) 1 0)))

(assert (= 2 (- security add1 add2 add3 add4)))

(check-sat)
(get-model)
(exit)