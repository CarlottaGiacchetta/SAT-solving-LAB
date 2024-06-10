(set-option :produce-models true)

(declare-const Beagles1 Int)
(declare-const Beagles2 Int)

(declare-const ACDC1 Int)
(declare-const ACDC2 Int)
(declare-const ACDC3 Int)

(declare-const RollingStonks Int)
(declare-const KanjiWest Int)



(assert (or (and (= Beagles1 1 ) (= Beagles2 2 )) (and (= Beagles1 5 ) (= Beagles2 6 ))))
(assert (and (= ACDC1 (+ ACDC2 1)) (= ACDC1 (+ ACDC3 2))))
(assert (or (= RollingStonks 1 ) (= RollingStonks 6 ) ))
(assert (and (not (= KanjiWest 1 )) (not (= KanjiWest 6 )) ))

(assert (and (>= ACDC1 1) (<= ACDC1 6)))
(assert (and (>= ACDC2 1) (<= ACDC2 6)))
(assert (and (>= ACDC3 1) (<= ACDC3 6)))
(assert (and (>= KanjiWest 1) (<= KanjiWest 6)))

(assert (distinct Beagles1 Beagles2 ACDC1 ACDC2 ACDC3 RollingStonks KanjiWest))



(check-sat)
(get-model)
;così mi dice unsat
(exit)