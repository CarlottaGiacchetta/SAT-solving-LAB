;Consider three chairs in a row and three guests:A,BeC.We
;know that:
;▶A does not want to sit next to C.
;▶A does not want to sit on the left most chair.
;▶B does not want to sit at the right of C
;Is it possible to satisfy the following constraints and find a valid
;placement?
(set-option :produce-models true)
(declare-const XA Bool);A è seduto sulla sedia X
(declare-const YA Bool)
(declare-const ZA Bool)

(declare-const XB Bool)
(declare-const YB Bool)
(declare-const ZB Bool)

(declare-const XC Bool)
(declare-const YC Bool)
(declare-const ZC Bool)

;A does not want to sit next to C.
(assert (not (and XA YC)))
(assert (not (and YA XC)))
(assert (not (and YA ZC)))
(assert (not (and ZA YC)))

;A does not want to sit on the left most chair.
(assert (not XA))

;B does not want to sit at the right of C
(assert (not (and YB XC )))
(assert (not (and ZB YC)))

;su una sedie ci deve essere almeno una persona
(assert (or XA XB XC ))
(assert (or YA YB YC ))
(assert (or ZA ZB ZC ))

;una persona deve usare almeno una sedia
(assert (or XA YA ZA ))
(assert (or XB YB ZB ))
(assert (or XC YC ZC ))

;una sedia per una persona
(assert (=> XA (and (not XB) (not XC))))
(assert (=> YA (and (not YB) (not YC))))
(assert (=> ZA (and (not ZB) (not ZC))))

(assert (=> XB (and (not XA) (not XC))))
(assert (=> YB (and (not YA) (not YC))))
(assert (=> ZB (and (not ZA) (not ZC))))

(assert (=> XC (and (not XA) (not XB))))
(assert (=> YC (and (not YA) (not YB))))
(assert (=> ZC (and (not ZA) (not ZB))))

(assert (=> XA (and (not YA) (not ZA))))
(assert (=> YA (and (not XA) (not ZA))))
(assert (=> ZA (and (not XA) (not YA))))

(assert (=> XB (and (not YB) (not ZB))))
(assert (=> YB (and (not XB) (not ZB))))
(assert (=> ZB (and (not XB) (not YB))))

(assert (=> XC (and (not YC) (not ZC))))
(assert (=> YC (and (not XC) (not ZC))))
(assert (=> ZC (and (not XC) (not YC))))

(check-sat)
(get-model)
(exit)




