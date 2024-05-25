;You are given the graph shown in the
;figure on the right. Suppose you want
;to color the nodes of this graph so that
;nodes connected by an edge cannot
;have the same color. Given these
;assumptions:
;▶ Is it possible to color the graph using only 2 colors?
(set-option :produce-models true)
(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)

(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)

(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)

(declare-const D1 Bool)
(declare-const D2 Bool)
(declare-const D3 Bool)

(assert (=> A1 (and (not B1) (not C1) (not D1))))
(assert (=> A2 (and (not B2) (not C2) (not D2))))
(assert (=> A3 (and (not B3) (not C3) (not D3))))

(assert (=> B1 (and (not A1) (not D1))))
(assert (=> B2 (and (not A2) (not D2))))
(assert (=> B3 (and (not A3) (not D3))))

(assert (=> C1 (and (not A1) (not D1))))
(assert (=> C2 (and (not A2) (not D2))))
(assert (=> C3 (and (not A3) (not D3))))

(assert (=> D1 (and (not B1) (not C1) (not A1))))
(assert (=> D2 (and (not B2) (not C2) (not A2))))
(assert (=> D3 (and (not B3) (not C3) (not A3))))

;almeno un colore per nodo 
(assert (or A1 A2 A3))
(assert (or B1 B2 B3))
(assert (or C1 C2 C3))
(assert (or D1 D2 D3))

;al massimo un colore per nodo
(assert (=> A1 (and (not A2) (not A3))))
(assert (=> A2 (and (not A1) (not A3))))
(assert (=> A3 (and (not A2) (not A1))))

(assert (=> B1 (and (not B2) (not B3))))
(assert (=> B2 (and (not B1) (not B3))))
(assert (=> B3 (and (not B2) (not B1))))

(assert (=> C1 (and (not C2) (not C3))))
(assert (=> C2 (and (not C1) (not C3))))
(assert (=> C3 (and (not C2) (not C1))))

(assert (=> D1 (and (not D2) (not D3))))
(assert (=> D2 (and (not D1) (not D3))))
(assert (=> D3 (and (not D2) (not D1))))

(check-sat)
(get-model)

;is it unique?
(assert (and (not A3) (not B2) (not C2) (not D1)))
(check-sat)
(get-model)
(exit)