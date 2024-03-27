(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)

(declare-const security Int)
(declare-const somma Int)
(declare-const num Int)

(declare-const add1 Int)
(declare-const add2 Int)
(declare-const add3 Int)
(declare-const add4 Int)


(assert (and (>= a 1) (<= a 9)))
(assert (and (>= b 1) (<= b 9)))
(assert (and (>= c 1) (<= c 9)))
(assert (and (>= d 1) (<= d 9)))
(assert (and (>= e 1) (<= e 9)))

(assert (distinct a b c d e))
(assert (= somma (+ a b c d e)))
(assert (= num (+ (* a 10000) (* b 1000) (* c 100) (* d 10) e)))

(assert (= security 4))


(define-fun c1 ((num Int) (a Int) (b Int)) Bool (xor (= 0 (mod num a)) (= 0 (mod num b))))
(define-fun c2 ((num Int) (a Int)) Bool (= 0 (mod num a)))
(define-fun c3 ((a Int) (b Int) (e Int) (d Int)) Bool (and (= a e) (= b d)))
(define-fun c4 ((a Int) (b Int) (c Int) (e Int) (d Int)) Bool (and (<= a b) (<= b c) (<= c d) (<= d e)))


(assert (= add1 (ite (c1 num 3 5) 1 0 )))
(assert (= add2 (ite (c2 num 10) 1 0 )))
(assert (= add3 (ite (c3 a b e d) 1 0 )))
(assert (= add4 (ite (c4 a b c e d) 1 0 )))

(assert (= 2 (- security add1 add2 add3 add4)))

(check-sat)
(get-model)
(exit)

