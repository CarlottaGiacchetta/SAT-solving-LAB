;Using the digits 1,2,3 and 4 you need to create a 3-length
;password. There are some rules that must be fulfilled:
;▶ The password should be even
;▶ We cannot use the same digit three times, otherwise it would bee asy to guess it.
;▶ It is possible to repeat the same digit twice, just make sure the two digits are not adjacent.
(set-option :produce-models true)

(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)
(declare-const A4 Bool)

(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const B4 Bool)

(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)
(declare-const C4 Bool)

;The password should be even
(assert (or C2 C4))

;We cannot use the same digit three times
(assert (=> (and A1 B1) (not C1)))
(assert (=> (and A1 C1) (not B1)))
(assert (=> (and C1 B1) (not A1)))

(assert (=> (and A2 B2) (not C2)))
(assert (=> (and A2 C2) (not B2)))
(assert (=> (and C2 B2) (not A2)))

(assert (=> (and A3 B3) (not C3)))
(assert (=> (and A3 C3) (not B3)))
(assert (=> (and C3 B3) (not A3)))

(assert (=> (and A4 B4) (not C4)))
(assert (=> (and A4 C4) (not B4)))
(assert (=> (and C4 B4) (not A4)))

;It is possible to repeat the same digit twice, just make sure the two digits are not adjacent
(assert (not (and A1 B1)))
(assert (not (and C1 B1)))

(assert (not (and A2 B2)))
(assert (not (and C2 B2)))

(assert (not (and A3 B3)))
(assert (not (and C3 B3)))

(assert (not (and A4 B4)))
(assert (not (and C4 B4)))

;almeno un numero per posizione
(assert (or A1 A2 A3 A4))
(assert (or B1 B2 B3 B4))
(assert (or C1 C2 C3 C4))

;al massimo un numero per posizione
(assert (=> A1 (and (not A2) (not A3) (not A4))))
(assert (=> A2 (and (not A1) (not A3) (not A4))))
(assert (=> A3 (and (not A2) (not A1) (not A4))))
(assert (=> A4 (and (not A2) (not A3) (not A1))))

(assert (=> B1 (and (not B2) (not B3) (not B4))))
(assert (=> B2 (and (not B1) (not B3) (not B4))))
(assert (=> B3 (and (not B2) (not B1) (not B4))))
(assert (=> B4 (and (not B2) (not B3) (not B1))))

(assert (=> C1 (and (not C2) (not C3) (not C4))))
(assert (=> C2 (and (not C1) (not C3) (not C4))))
(assert (=> C3 (and (not C2) (not C1) (not C4))))
(assert (=> C4 (and (not C2) (not C3) (not C1))))

(check-sat)
(get-model)

;is it unique?
(assert (and (not A3) (not B4) (not C2)))
;(assert (and (not A4) (not B3) (not C4)))
(check-sat)
(get-model)
(exit)
