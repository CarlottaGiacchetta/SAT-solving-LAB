(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)

(assert (and (>= x1 1) (<= x1 4)))
(assert (and (>= x2 1) (<= x2 4)))
(assert (and (>= x3 1) (<= x3 4)))
(assert (and (>= x4 1) (<= x4 4)))
;no diagonali
(assert (and (not (= x1 (+ 1 x4))) (not (= x4 (+ 1 x1)))))
(assert (and (not (= x2 (+ 1 x3))) (not (= x3 (+ 1 x2)))))
;devono essere tutti diversi
(assert (distinct x1 x2 x3 x4))

(check-allsat ((= 1 x1) (= 2 x1) (= 3 x1) (= 4 x1)
               (= 1 x2) (= 2 x2) (= 3 x2) (= 4 x2)
               (= 1 x3) (= 2 x3) (= 3 x3) (= 4 x3)
               (= 1 x4) (= 2 x4) (= 3 x4) (= 4 x4)))
(get-model)
(exit)