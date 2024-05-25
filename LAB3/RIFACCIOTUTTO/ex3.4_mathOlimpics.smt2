;Find the number of positive integers with three not necessarily
;distinct digits, abc, with a not= 0 and c not= 0 such that both abc and
;cba are multiples of 4.

(set-option :produce-models true)
(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const num1 Int)
(declare-const num2 Int)


(assert (and (> A 0) (< A 10)))
(assert (and (>= B 0) (< B 10)))
(assert (and (> C 0) (< C 10)))
(assert (= num1 (+ (* A 100) (* B 10) C)))
(assert (= num2 (+ (* C 100) (* B 10) A)))

(assert (= 0 (mod num1 4)))
(assert (= 0 (mod num2 4)))
;prova per capire se è unico
(assert ( and (not (= 202 num1)) (not (= 212 num1)) (not (= 612 num1)) (not (= 632 num1))))

(check-sat)
(get-model)
(exit)