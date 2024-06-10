(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(declare-const num_colors Int)

(define-fun max ((A Int) (B Int)) Int (ite (>= A B) A B))

(assert (and (>= x1 1) (<= x1 8)))
(assert (and (>= x2 1) (<= x2 8)))
(assert (and (>= x3 1) (<= x3 8)))
(assert (and (>= x4 1) (<= x4 8)))
(assert (and (>= x5 1) (<= x5 8)))
(assert (and (>= x6 1) (<= x6 8)))
(assert (and (>= x7 1) (<= x7 8)))
(assert (and (>= x8 1) (<= x8 8)))

(assert (and (not (= x1 x2)) (not (= x1 x3)) ))
(assert (and (not (= x2 x3)) (not (= x2 x4)) ))
(assert (and (not (= x3 x4)) (not (= x3 x5)) (not (= x3 x6)) (not (= x3 x8))))
(assert (and (not (= x4 x5)) ))
(assert (and (not (= x5 x6)) (not (= x5 x7))))
(assert (and (not (= x6 x7)) (not (= x6 x8))))
(assert (and (not (= x7 x8)) ))

(assert (= num_colors (max x1 (max x2 (max x3 (max x4 (max x5 (max x6 (max x7 x8)))))))))

(minimize num_colors)

(check-sat)
(get-objectives)
(get-model)
(exit)