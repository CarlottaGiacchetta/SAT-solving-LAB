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

(declare-const B1 Bool)
(declare-const B2 Bool)

(declare-const C1 Bool)
(declare-const C2 Bool)

(declare-const D1 Bool)
(declare-const D2 Bool)

(assert (=> A1 (and (not B1) (not C1) (not D1))))
(assert (=> A2 (and (not B2) (not C2) (not D2))))

(assert (=> B1 (and (not A1) (not D1))))
(assert (=> B2 (and (not A2) (not D2))))

(assert (=> C1 (and (not A1) (not D1))))
(assert (=> C2 (and (not A2) (not D2))))

(assert (=> D1 (and (not B1) (not C1) (not A1))))
(assert (=> D2 (and (not B2) (not C2) (not A2))))

;un colore per nodo
(assert (xor A1 A2))
(assert (xor B1 B2))
(assert (xor C1 C2))
(assert (xor D1 D2))
(check-sat)
(get-model)
(exit)




