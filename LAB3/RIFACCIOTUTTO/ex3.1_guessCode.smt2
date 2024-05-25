;A, B, C, and D are single-digit numbers. The following equations 
;A + C = D
;A x B = C
;C - B = B
;A x 4 = D
;find the numbers

(set-option :produce-models true)
(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

;one digit number
(assert (and (> A 0) (< A 10)))
(assert (and (> B 0) (< B 10)))
(assert (and (> C 0) (< C 10)))
(assert (and (> D 0) (< D 10)))

(assert (distinct A B C D) )

;A + C = D
(assert (= D (+ A C)))
;A x B = C
(assert (= C (* A B)))
;C - B = B
(assert (= B (- C B)))
;A x 4 = D
(assert (= D (* A 4)))

(check-sat)
(get-model)

;is it unique?
(assert (not (= 8 D)))
(check-sat)
(get-model)
(exit)
