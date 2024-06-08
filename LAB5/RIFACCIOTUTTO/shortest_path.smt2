(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const G Int)
(declare-const H Int)

(assert (= B 0))
(assert (or (= A (+ B 4)) (= A (+ D 2))))
(assert (or (= C (+ B 4)) (= C (+ E 7))))
(assert (or (= D (+ A 2)) (= D (+ E 3))))
(assert (or (= E (+ B 6)) (= E (+ C 7)) (= E (+ D 3)))))
(assert (= F (+ D 5)))
(assert (= H (+ E 8)))
(assert (or (= G (+ F 9)) (= G (+ H 3))))



(minimize G )


(check-sat)
(get-objectives)
(get-model)
(exit)