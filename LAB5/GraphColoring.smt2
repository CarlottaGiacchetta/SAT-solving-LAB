(set-option :produce-models true)

(declare-const X1 Int)
(declare-const X2 Int)
(declare-const X3 Int)
(declare-const X4 Int)
(declare-const X5 Int)
(declare-const X6 Int)
(declare-const X7 Int)
(declare-const X8 Int)
(declare-const count Int)

(assert (> X1 0))
(assert (< X1 7))
(assert (> X2 0))
(assert (< X2 7))
(assert (> X3 0))
(assert (< X3 7))
(assert (> X4 0))
(assert (< X4 7))
(assert (> X5 0))
(assert (< X5 7))
(assert (> X6 0))
(assert (< X6 7))
(assert (> X7 0))
(assert (< X7 7))
(assert (> X8 0))
(assert (< X8 7))


;condizioni
; Conditions
(assert (distinct X1 X2 X3))
(assert (distinct X2 X3 X4))
(assert (and (distinct X3 X4) (distinct X3 X5) (distinct X3 X6) (distinct X3 X8) ))
(assert (and (distinct X4 X5) (distinct X4 X6)))
(assert (distinct X5 X6 X7))
(assert (distinct X6 X7 X8))

(assert (= count (+ 
                    (ite (or (= X1 X4) (= X1 X5) (= X1 X6) (= X1 X7) (= X1 X8)) 1 0)
                    (ite (or (= X2 X5) (= X2 X6) (= X2 X7) (= X2 X8)) 1 0)
                    (ite (= X3 X7) 1 0)
                    (ite (or (= X4 X7) (= X4 X8)) 1 0)
                    (ite (= X5 X8) 1 0)
                  )))


(maximize count)

(check-sat)
(get-objectives)
(get-model)
(exit)
