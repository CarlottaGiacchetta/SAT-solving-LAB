;Kakuro is a puzzle in which one
;must put the numbers 1 to 9 in
;the different cells such that they
;satisfy certain constraints. If a
;clue is present in a row or
;column, the sum of the cell for
;that row should be equal to the
;value. Within each sum all the
;numbers have to be different, so
;to add up to 4 we can have 1+3
;or 3+1. Can we find a solution
;using SMT solvers?

(set-option :produce-models true)
;prima riga
(declare-const x11 Int)
(declare-const x12 Int)
(declare-const x13 Int)
(declare-const x14 Int)
;seconda riga
(declare-const x21 Int)
(declare-const x22 Int)
(declare-const x23 Int)
(declare-const x24 Int)
;terza riga
(declare-const x31 Int)
(declare-const x32 Int)
(declare-const x33 Int)
(declare-const x34 Int)
;quarta riga
(declare-const x41 Int)
(declare-const x42 Int)
(declare-const x43 Int)
(declare-const x44 Int)
;quinta riga
(declare-const x51 Int)
(declare-const x52 Int)
(declare-const x53 Int)
(declare-const x54 Int)

;prima riga
(assert (and (> x11 0) (< x11 10)))
(assert (and (> x12 0) (< x12 10)))
(assert (and (> x13 0) (< x13 10)))
(assert (= 0 x14))
;seocnda riga
(assert (and (> x21 0) (< x21 10)))
(assert (and (> x22 0) (< x22 10)))
(assert (and (> x23 0) (< x23 10)))
(assert (= 0 x24))
;terza riga
(assert (and (> x31 0) (< x31 10)))
(assert (and (> x32 0) (< x32 10)))
(assert (= 0 x33))
(assert (= 0 x34))
;quarta riga
(assert (= 0 x41))
(assert (and (> x42 0) (< x42 10)))
(assert (and (> x43 0) (< x43 10)))
(assert (and (> x44 0) (< x44 10)))
;quinta riga
(assert (= 0 x51))
(assert (and (> x52 0) (< x52 10)))
(assert (and (> x53 0) (< x53 10)))
(assert (and (> x54 0) (< x54 10)))

(assert (distinct x11 x12 x13))
(assert (distinct x21 x22 x23))
(assert (distinct x31 x32))
(assert (distinct x42 x43 x44))
(assert (distinct x52 x53 x54))

(assert (distinct x11 x21 x31))
(assert (distinct x12 x22 x32 x42 x52))
(assert (distinct x13 x23))
(assert (distinct x43 x53))
(assert (distinct x44 x54))

;somme per riga
(assert (= 9 (+ x11 x12 x13)))
(assert (= 13 (+ x21 x22 x23)))
(assert (= 13 (+ x31 x32)))
(assert (= 7 (+ x42 x43 x44)))
(assert (= 19 (+ x52 x53 x54)))

;somme per colonna
(assert (= 9 (+ x11 x21 x31)))
(assert (= 34 (+ x12 x22 x32 x42 x52)))
(assert (= 4 (+ x13 x23)))
(assert (= 11 (+ x43 x53)))
(assert (= 3 (+ x44 x54)))

(check-sat)
(get-model)
(exit)
 




