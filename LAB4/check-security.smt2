(set-option :produce-models true)

(declare-const d1 Int)
(declare-const d2 Int)
(declare-const d3 Int)
(declare-const d4 Int)
(declare-const d5 Int)

(declare-const num Int)

(assert (and (>= d1 1) (<= d1 9)))
(assert (and (>= d2 0) (<= d2 9)))
(assert (and (>= d3 0) (<= d3 9)))
(assert (and (>= d4 0) (<= d4 9)))
(assert (and (>= d5 0) (<= d5 9)))

(assert (= num (+ (* d1 10000) (* d2 1000) (* d3 100) (* d4 10) d5)))
(assert (and (>= num 10000) (<= num 99999)))

;;num is multiple of 3 or 5, but not both
;(declare-fun cond1 (num Int) Int (ite (xor (= 0 (mod num 3)) (= 0 (mod num 5))) 1 0))
;;the sum of digits is a multiple of 10
;(declare-fun cond2 ((d1 Int) (d2 Int) (d3 Int) (d4 Int) (d5 Int)) Int (ite (= 0 (mod (+ d1 d2 d3 d4 d5) 10)) 1 0))
;;the number is palindrome
;(declare-fun cond3 ((d1 Int) (d2 Int) (d3 Int) (d4 Int) (d5 Int)) Int (ite (= (+ (* d1 10000) (* d2 1000) (* d3 100) (* d4 10) d5) (+ (* d5 10000) (* d4 1000) (* d3 100) (* d2 10) d1)) 1 0))
;;the digits are in ascending order (including equality)
;(declare-fun cond4 ((d1 Int) (d2 Int) (d3 Int) (d4 Int) (d5 Int)) Int (ite (and (<= d1 d2) (<= d2 d3) (<= d3 d4) (<= d4 d5)) 1 0))

(assert (= 2 (- 4 (+ 
                    (ite (xor (= 0 (mod num 3)) (= 0 (mod num 5))) 1 0) 
                    (ite (= 0 (mod (+ d1 d2 d3 d4 d5) 10)) 1 0) 
                    (ite (= (+ (* d1 10000) (* d2 1000) (* d3 100) (* d4 10) d5) (+ (* d5 10000) (* d4 1000) (* d3 100) (* d2 10) d1)) 1 0) 
                    (ite (and (<= d1 d2) (<= d2 d3) (<= d3 d4) (<= d4 d5)) 1 0)))))

(check-sat)
(get-model)
(exit)