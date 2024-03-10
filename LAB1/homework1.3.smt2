(declare-const At)
(declare-const Af)
(declare-const Bt)
(declare-const Bf)
(declare-const Ct)
(declare-const Cf)


;clear conditions
(assert (=> At (and Bf Ct))) ;B is guilty and C is innocent
(assert (=> Bt (=> Af Cf))) ;If A is guilty, then C is also guilty
(assert (=> Ct (or (and Af Bf) (and Af Bt) (and At Bf)))) ;I’m innocent and one of the others, perhaps even the two, are guilty

;hide condtions
(assert or (and Af (not At)) (and At (not Af)))
(assert or (and Bf (not Bt)) (and Bt (not Bf)))
(assert or (and Cf (not Ct)) (and Ct (not Cf)))