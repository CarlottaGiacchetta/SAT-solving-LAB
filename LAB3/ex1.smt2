(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

(declare-const maximum Int)

;definisco la funzione massimo con un if than else
(define-fun max ((a Int) (b Int)) Int (ite (>= a b) a b ));è un ite()

(assert (= maximum (max A (max B (max C D)))))

;clear conditions
(assert = (D (+ A C)))
(assert = (C (* A B)))
(assert = (B (+ C (not B))))
(assert = (D (* A 4)))

(assert  (>= A 0))
(assert  (<= A 9))

(assert  (>= B 0))
(assert  (<= B 9))

(assert  (>= C 0))
(assert  (<= C 9))

(assert  (>= D 0))
(assert  (<= D 9))

(assert (distinct A B C D) )

(check-sat)
(get-model)
(exit)
