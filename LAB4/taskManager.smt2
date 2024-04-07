(set-option :produce-models true)

(declare-const A Int )
(declare-const B Int )
(declare-const C Int )
(declare-const D Int )
(declare-const E Int )

;vallori da 1 a 5
(assert (and (>= A 1) (<= A 5)))
(assert (and (>= B 1) (<= B 5)))
(assert (and (>= C 1) (<= C 5)))
(assert (and (>= D 1) (<= D 5)))
(assert (and (>= E 1) (<= E 5)))

; tutti valori diversi 
(assert (distinct A B C D E))

;A dopo D 
(assert (> A D))
;B after C and E
(assert (and (> B C ) (> B E)))
;E after B or D 
(assert (or (> E D ) (> E B)))
;C after A 
(assert (> C A))

(check-sat)
(get-model)
(exit)
