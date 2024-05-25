;You are asked to build a circuit for a top-secret project. Each gate
;costs a lot of money, so you suggest an alternative and cheaper
;circuit. Are the two circuits are equivalent?
(set-option :produce-models true)
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(declare-const E Bool)
(declare-const F Bool)
(declare-const G Bool)
(declare-const H Bool)

(declare-const I Bool)
(declare-const L Bool)

(declare-const Q Bool)

;conditions on the original
(assert (= E (and A B)))
(assert (= F (and C B)))
(assert (= G (or C B)))
(assert (= H (and F G)))
(assert (= Q (or E H))) ;end node of original
;conditions on the siplified
(assert (= I (or A C)))
(assert (= L (and I B)));end node of siplified
;check if are equal
(assert (= Q L))

(check-sat)
(get-model)
(exit)