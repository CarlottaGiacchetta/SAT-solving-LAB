(set-option :produce-models true)
;nodi
(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const G Int)

;archi
(declare-const AB Bool)
(declare-const BC Bool)
(declare-const CE Bool)
(declare-const CD Bool)
(declare-const ED Bool)
(declare-const EF Bool)
(declare-const DF Bool)
(declare-const DG Bool)



(declare-const num Int)


;le variabili pososno essere 0 o 1
(assert (or (= A 1) (= A 0)))
(assert (or (= B 1) (= B 0)))
(assert (or (= C 1) (= C 0)))
(assert (or (= D 1) (= D 0)))
(assert (or (= E 1) (= E 0)))
(assert (or (= F 1) (= F 0)))
(assert (or (= G 1) (= G 0)))



;almeno uno dei due nodi di un arco deve rimanere
(assert (or (= A 1) (= B 1)))
(assert (or (= B 1) (= C 1)))
(assert (or (= C 1) (= E 1)))
(assert (or (C= 1) (= D 1)))
(assert (or (= E 1) (= D 1)))
(assert (or (= E 1) (= F 1)))
(assert (or (= D 1) (= F 1)))
(assert (or (= D 1) (= G 1)))

;se un ndo è true allora anche l'arco contenente quel nodo è true 
(assert (=> (= A 1) AB ))
(assert (=> (= B 1) (and AB BC )))
(assert (=> (= C 1) (and BC CD CE )))
(assert (=> (= D 1) (and DF DF CD )))
(assert (=> (= E 1) (and ED EF CE )))
(assert (=> (= F 1) (and DF EF )))
(assert (=> (= G 1) (and DG )))

;devono rimanere tutti gli archi
(assert (and AB BC CD CE DF DG ED EF))


(minimize (+ A B C D E F G))



(check-sat)
(get-objectives)
(get-model)
(exit)







