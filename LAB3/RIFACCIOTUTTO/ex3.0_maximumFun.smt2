(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const maximum Int)

(define-fun max ((A Int) (B Int)) Int (ite (>= A B) A B));

;one digit number
(assert (and (> A 0) (< A 10)))
(assert (and (> B 0) (< B 10)))
(assert (and (> C 0) (< C 10)))
(assert (and (> D 0) (< D 10)))

;risolvo equazione di prima
;A + C = D
(assert (= D (+ A C)))
;A x B = C
(assert (= C (* A B)))
;C - B = B
(assert (= B (- C B)))
;A x 4 = D
(assert (= D (* A 4)))

;resituisci il masismo valore
(assert (= maximum (max A (max B (max C D)))))

(check-sat)
(get-model)
(exit)
