(set-option :produce-models true)
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)

(assert (=> A (and (not B) (not C) (not D)) ))
(assert (=> B (and (not A) (not D))) )
(assert (=> C (and (not A) (not D))) )
(assert (=> D (and (not B) (not C) (not A))) )

(assert (=> (not A) (and B C D) ))
(assert (=> (not B) (and A D )) )
(assert (=> (not C) (and A D )) )
(assert (=> (not D) (and B C A)) )


(check-sat)
(get-model)
(exit)