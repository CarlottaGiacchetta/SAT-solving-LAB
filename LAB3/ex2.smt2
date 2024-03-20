; Use semi columns for comments
(set-option :produce-models true)

;variabile x al tempo 1, posizione 1
(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

(assert  (>= A 1))
(assert  (<= A 4))

(assert  (>= B 1))
(assert  (<= B 4))

(assert  (>= C 1))
(assert  (<= C 4))

(assert  (>= D 1))
(assert  (<= D 4))

; Interpreted function
(assert (distinct A B C D))

(assert (=> (= A 1) (not (= D 2))))
(assert (=> (= B 1) (not (= C 2))))
(assert (=> (= C 1) (not (= B 2))))
(assert (=> (= D 1) (not (= A 2))))

(assert (=> (= A 2) (not (= D 3))))
(assert (=> (= B 2) (not (= C 3))))
(assert (=> (= C 2) (not (= B 3))))
(assert (=> (= D 2) (not (= A 3))))

(assert (=> (= A 3) (not (= D 4))))
(assert (=> (= B 3) (not (= C 4))))
(assert (=> (= C 3) (not (= B 4))))
(assert (=> (= D 3) (not (= A 4))))


(check-allsat (
    (= A 1)
    (= A 2)
    (= A 3)
    (= A 4)
    (= B 1)
    (= B 2)
    (= B 3)
    (= B 4)
    (= C 1)
    (= C 2)
    (= C 3)
    (= C 4)
    (= D 1)
    (= D 2)
    (= D 3)
    (= D 4)

)); deve ricevere in input boolean variable
(get-model)
(exit)