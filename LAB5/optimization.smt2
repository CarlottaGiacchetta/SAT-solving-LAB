(set-option :produce-models true)


(declare-const x Int)
(declare-const y Int)
(declare-const product1 Int)



(assert (> x 0))
(assert (> y 0))
(assert (> product1 0))
(assert (< product1 200))


(assert (= 9 (+ x y)))
(assert (= product1  (* y (* x x))))


(maximize product1)



(check-sat)
(get-objectives)
(get-model)
(exit)