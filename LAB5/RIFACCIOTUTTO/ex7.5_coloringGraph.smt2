;Solve the color graph problem again with the following map of
;countries (so you must ensure adjacent countries do not have the
;same color). This time uses OMT to retrieve the minimum number
;of colors that satisfy the problem
(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(declare-const somma Int)

(assert (and (> x1 0) (< x1 9)))
(assert (and (> x2 0) (< x2 9)))
(assert (and (> x3 0) (< x3 9)))
(assert (and (> x4 0) (< x4 9)))
(assert (and (> x5 0) (< x5 9)))
(assert (and (> x6 0) (< x6 9)))
(assert (and (> x7 0) (< x7 9)))
(assert (and (> x8 0) (< x8 9)))

(assert (and (not (= x1 x2)) (not (= x1 x3))))
(assert (and (not (= x2 x1)) (not (= x2 x3)) (not (= x2 x4))))
(assert (and (not (= x3 x1)) (not (= x3 x2)) (not (= x3 x4)) (not (= x3 x5)) (not (= x3 x6)) (not (= x3 x8))))
(assert (and (not (= x4 x2)) (not (= x4 x3)) (not (= x4 x5))))
(assert (and (not (= x5 x3)) (not (= x5 x4)) (not (= x5 x6)) (not (= x5 x7))))
(assert (and (not (= x6 x3)) (not (= x6 x5)) (not (= x6 x7)) (not (= x6 x8))))
(assert (and (not (= x7 x5)) (not (= x7 x6)) (not (= x7 x8))))

(assert (= somma (+ x1 x2 x3 x4 x5 x6 x7 x8)))
(minimize somma)

(check-sat)
(get-objectives)
(get-model)
(exit)




