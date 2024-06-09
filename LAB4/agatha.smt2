(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)

(declare-const HAA Bool)
(declare-const HAB Bool)
(declare-const HAC Bool)
(declare-const HBA Bool)
(declare-const HBB Bool)
(declare-const HBC Bool)
(declare-const HCA Bool)
(declare-const HCB Bool)
(declare-const HCC Bool)

(declare-const RAB Bool)
(declare-const RAC Bool)
(declare-const RBA Bool)
(declare-const RBC Bool)
(declare-const RCA Bool)
(declare-const RCB Bool)

(assert (distinct RAB RBA))
(assert (distinct RAC RCA))
(assert (distinct RCB RBC))


(declare-const killer Int)

(assert (= A 1))
(assert (= B 2))
(assert (= C 3))
(assert (and (>= killer 2) (<= killer 3)))

;killer always hates his victim
(assert (=> (= killer 1) HAA))
(assert (=> (= killer 2) HBA))
(assert (=> (= killer 3) HCA))
;killer is never richer than his victim
(assert (=> (= killer 2) RBA))
(assert (=> (= killer 3) RCA))
;Charles hates no one that Aunt Agatha hates
(assert (=> HAA (not HCA)))
(assert (=> HAB (not HCB)))
(assert (=> HAC (not HCC)))
;Agatha hates everyone except the butler
(assert (and HAA (not HAB) HAC))
;The butler hates everyone not richer than Aunt Agatha
(assert (=> RAB HBB))
(assert (=> RAC HBC))
;The butler hates everyone Aunt Agatha hates
(assert (=> HAA HBA))
(assert (=> HAB HBB))
(assert (=> HAC HBC))
;No one hates everyone
(assert (or (= 0 (+ (ite HAA 1 0) (ite HAB 1 0) (ite HAC 1 0))) (= 1 (+ (ite HAA 1 0) (ite HAB 1 0) (ite HAC 1 0))) (= 2 (+ (ite HAA 1 0) (ite HAB 1 0) (ite HAC 1 0)))))
(assert (or (= 0 (+ (ite HBA 1 0) (ite HBB 1 0) (ite HBC 1 0))) (= 1 (+ (ite HBA 1 0) (ite HBB 1 0) (ite HBC 1 0))) (= 2 (+ (ite HBA 1 0) (ite HBB 1 0) (ite HBC 1 0)))))
(assert (or (= 0 (+ (ite HCA 1 0) (ite HCB 1 0) (ite HCC 1 0))) (= 1 (+ (ite HCA 1 0) (ite HCB 1 0) (ite HCC 1 0))) (= 2 (+ (ite HCA 1 0) (ite HCB 1 0) (ite HCC 1 0)))))

(check-sat)
(get-model)
(exit)