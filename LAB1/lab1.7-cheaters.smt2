(set-option :produce-models true)
(declare-const AG Bool)
(declare-const AI Bool)

(declare-const BG Bool)
(declare-const BI Bool)

(declare-const CG Bool)
(declare-const CI Bool)

;first condition
(assert (=> AI (and BG CI)))
;second condition
(assert (=> BI (and AG CG)))
;third condition
(assert (=> CI (and CI (or AG BG))))

;hidden condition
(assert (=> AI (not AG)))
(assert (=> BI (not BG)))
(assert (=> CI (not CG)))
(assert (=> AG (not AI)))
(assert (=> BG (not BI)))
(assert (=> CG (not CI)))

(assert (or AI AG))
(assert (or BI BG))
(assert (or CI CG))

(check-sat)
(get-model)
(exit)