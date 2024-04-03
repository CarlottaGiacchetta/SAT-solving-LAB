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

;first conditions
(assert (or C2 C4))
;second conditions
(assert (=> A1 (or (xor B1 C1) (and (not B1) (not C1)))) )
(assert (=> A2 (or (xor B2 C2) (and (not B2) (not C2)))) )
(assert (=> A3 (or (xor B3 C3) (and (not B3) (not C3)))) )
(assert (=> A4 (or (xor B4 C4) (and (not B4) (not C4)))) )
(assert (=> B1 (or (xor A1 C1) (and (not A1) (not C1)))) )
(assert (=> B2 (or (xor A2 C2) (and (not A2) (not C2)))) )
(assert (=> B3 (or (xor A3 C3) (and (not A3) (not C3)))) )
(assert (=> B4 (or (xor A4 C4) (and (not A4) (not C4)))) )
(assert (=> C1 (or (xor A1 B1) (and (not A1) (not B1)))) )
(assert (=> C2 (or (xor A2 B2) (and (not A2) (not B2)))) )
(assert (=> C3 (or (xor A3 B3) (and (not A3) (not B3)))) )
(assert (=> C4 (or (xor A4 B4) (and (not A4) (not B4)))) )
;third conditions
(assert (=> A1 (not B1)))
(assert (=> A2 (not B2)))
(assert (=> A3 (not B3)))
(assert (=> A4 (not B4)))
(assert (=> B1 and((not A1) (not C1))))
(assert (=> B2 and((not A2) (not C2))))
(assert (=> B3 and((not A3) (not C3))))
(assert (=> B4 and((not A4) (not C4))))
(assert (=> C1 (not B1)))
(assert (=> C2 (not B2)))
(assert (=> C3 (not B3)))
(assert (=> C4 (not B4)))
;hidden condition
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

(assert (or A1 A2 A3 A4))
(assert (or B1 B2 B3 B4))
(assert (or C1 C2 C3 C4))


(check-sat)
(get-model)
(exit)