(declare-const xA1 Bool)
(declare-const xA2 Bool)
(declare-const xA3 Bool)
(declare-const xA4 Bool)
(declare-const xB1 Bool)
(declare-const xB2 Bool)
(declare-const xB3 Bool)
(declare-const xB4 Bool)



;clear conditions

;first constraint
(assert (or (and xA1 (not xA2) (not xB2)) (and xB2 (not xA1) (not xB1))))
;se uno è corretto vuol dire che l'altro non lo è 

;second constraint
(assert (and (not xA1) (not xB1) (not xA4) (not xB4)))
;è sbagliato sia il numero che la posizione

;third constraint
(assert (or (and xB4 (not xA4) (not xB3) (not xA3)) (and xA3 (not xB3) (not xA4) (not xB4))))



;hidden conditions
;almeno uno, massimo uno, se e solo se
;quando si parla di celle dev sempre tenere in consideraizone queste consideraizone

(assert  (or xA1 xA2 xA3 xA4)) ;almeno un numero nella prima cella
(assert  (or xB1 xB2 xB3 xB4))

;sulla A può stare solo 1 numero
(assert (=> xA1 (and (not xA2) (not xA3) (not xA4))))
(assert (=> xA2 (and (not xA1) (not xA3) (not xA4))))
(assert (=> xA3 (and (not xA2) (not xA1) (not xA4))))
(assert (=> xA4 (and (not xA2) (not xA3) (not xA4))))

;sulla B può stare solo 1 numero
(assert (=> xB1 (and (not xB2) (not xB3) (not xB4))))
(assert (=> xB2 (and (not xB1) (not xB3) (not xB4))))
(assert (=> xB3 (and (not xB2) (not xB1) (not xB4))))
(assert (=> xB4 (and (not xB2) (not xB3) (not xB4))))

;è unica? (togli punto e virgola per verificare che sia unica)
;(assert (and (not xA3) (not xB2))) ; NO, NON è UNICA 


(check-sat)
(get-model)
(exit)