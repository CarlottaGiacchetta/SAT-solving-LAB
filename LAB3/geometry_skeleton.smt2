; Use semi columns for comments
(set-option :produce-models true)

(declare-const xa Real)
(declare-const ya Real)
(declare-const xb Real)
(declare-const yb Real)

(declare-const x Real)
(declare-const m Real)
(declare-const q Real)

; Interpreted function
(define-fun f ((x Real)) Real (+ q (* m x)))

(assert ( = xa 1 ))
(assert ( = xb 2 ))
(assert ( = ya 3 ))
(assert ( = yb 7 ))


(assert (= m (/(- yb ya) (- xb xa))))
(assert (= q (- ya (* m xa))))

(assert (= 0 (f x)))

(check-sat)
(get-model)
(exit)