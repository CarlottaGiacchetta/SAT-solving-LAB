(set-option :produce-models true)

(declare-const Beagles1 Int)
(declare-const Beagles2 Int)

(declare-const ACDC1 Int)
(declare-const ACDC2 Int)
(declare-const ACDC3 Int)

(declare-const RollingStonks Int)
(declare-const KanjiWest Int)
(declare-const KanjiWest Int)

(declare-const num_constraints Int)


(assert (and (= ACDC1 (+ ACDC2 1)) (= ACDC1 (+ ACDC3 2))))

;(assert (and (>= Beagles1 1) (<= Beagles1 6)))
;(assert (and (>= Beagles2 1) (<= Beagles2 6)))
;(assert (and (>= ACDC1 1) (<= ACDC1 6)))
;(assert (and (>= ACDC2 1) (<= ACDC2 6)))
;(assert (and (>= ACDC3 1) (<= ACDC3 6)))
;(assert (and (>= RollingStonks 1) (<= RollingStonks 6)))
;(assert (and (>= KanjiWest 1) (<= KanjiWest 6)))

(assert (>= Beagles1 1) )
(assert (>= Beagles2 1) )
(assert (and (>= ACDC2 1) (<= ACDC2 6)))
(assert (and (>= ACDC3 1) (<= ACDC3 6)))
(assert (and (>= ACDC1 1) (<= ACDC1 6)))
(assert (>= RollingStonks 1))
(assert (>= KanjiWest 1))

(assert (distinct Beagles1 Beagles2 ACDC1 ACDC2 ACDC3 RollingStonks KanjiWest))

(assert (= num_constraints (+ (ite (or (and (= Beagles1 1 ) (= Beagles2 2 )) (and (= Beagles1 5 ) (= Beagles2 6 ))) 1 0)
                              (ite (and (not (= KanjiWest 1 )) (not (= KanjiWest 6 )) (<= KanjiWest 5 ) ) 1 0)
                              (ite (or (= RollingStonks 1 ) (= RollingStonks 6 )) 1 0)
                              1)))

(maximize num_constraints)

(check-sat)
(get-objectives)
(get-model)
(exit)