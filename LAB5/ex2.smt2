(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(define-fun G () Int 0)
(declare-const H Int)


(assert (or (= A (+ B 4)  )(= A (+ D 2))))
;(assert (= A (or (+ B 4) (+ D 2) )))
;(assert (= B (or (+ C 4) (+ E 6) (+ A 4) )))
;(assert (= C (or (+ B 4) (+ E 7) 0)))
;(assert (= D (or (+ A 2) (+ E 3) (+ F 5) )))
;(assert (= E (or (+ B 6) (+ C 7) (+ D 3) (+ H 8) )))
;(assert (= F (or (+ D 5) (+ G 9) )))
;(assert (= H (or (+ E 8) (+ G 3) )))

(minimize B)


(check-sat)
(get-objectives)
(get-model)
(exit)