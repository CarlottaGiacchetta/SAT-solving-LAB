(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const G Int)
(declare-const H Int)

(declare-const path-cost Int)

(assert (= 0 B))
;A
(assert (or (= A (+ B 4)) (= A (+ D 2))))
;C
(assert (or (= C (+ B 4)) (= C (+ E 7))))
;D
(assert (or (= D (+ E 3)) (= D (+ A 2)) (= D (+ F 3))))
;E
(assert (or (= E (+ D 3)) (= E (+ B 6)) (= E (+ C 7)) (= E (+ H 8))))
;F
(assert (or (= F (+ D 5)) (= F (+ G 9))))
;G 
(assert (or (= G (+ F 9)) (= G (+ H 3))))
;H
(assert (or (= H (+ G 3)) (= H (+ E 8))))

(maximize -G)

(check-sat)
(get-objectives)
(get-model)
(exit)

