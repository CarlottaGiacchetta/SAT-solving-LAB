(set-option :produce-models true)

(declare-const x1 Bool)
(declare-const x2 Bool)
(declare-const x3 Bool)
(declare-const x4 Bool)
;collegamenti
(declare-const x12 Bool)
(declare-const x13 Bool)
(declare-const x14 Bool)
(declare-const x23 Bool)
(declare-const x24 Bool)
(declare-const x34 Bool)

(declare-const conta Int)

(assert (= x12 true))
(assert (= x13 true))
(assert (= x14 true))
(assert (= x23 false))
(assert (= x24 true))
(assert (= x34 true))

(assert (and (=> (and x1 x2) x12)
             (=> (and x1 x3) x13)
             (=> (and x1 x4) x14)
             (=> (and x2 x3) x23)
             (=> (and x2 x4) x24)
             (=> (and x3 x4) x34)))


(assert (= conta (+ (ite x1 1 0)
                    (ite x2 1 0)
                    (ite x3 1 0)
                    (ite x4 1 0)
                    )))

(maximize conta)

(check-sat)
(get-objectives)
(get-model)
(exit)
