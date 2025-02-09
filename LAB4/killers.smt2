(set-option :produce-models true)

(declare-const killerAgatha Bool)
(declare-const killerButler Bool)
(declare-const killerCharles Bool)

(declare-const AgathaHatesAgatha Bool)
(declare-const AgathaHatesButler Bool)
(declare-const AgathaHatesCharles Bool)
(declare-const ButlerHatesAgatha Bool)
(declare-const ButlerHatesButler Bool)
(declare-const ButlerHatesCharles Bool)
(declare-const CharlesHatesAgatha Bool)
(declare-const CharlesHatesButler Bool)
(declare-const CharlesHatesCharles Bool)

(declare-const AgathaRicherAgatha Bool)
(declare-const AgathaRicherButler Bool)
(declare-const AgathaRicherCharles Bool)
(declare-const ButlerRicherAgatha Bool)
(declare-const ButlerRicherButler Bool)
(declare-const ButlerRicherCharles Bool)
(declare-const CharlesRicherAgatha Bool)
(declare-const CharlesRicherButler Bool)
(declare-const CharlesRicherCharles Bool)

(assert (or killerAgatha killerButler killerCharles))
(assert (and (not AgathaRicherAgatha) (not ButlerRicherButler) (not CharlesRicherCharles)))
(assert (and (xor AgathaRicherButler ButlerRicherAgatha) (xor AgathaRicherCharles CharlesRicherAgatha) (xor ButlerRicherCharles CharlesRicherButler)))

(assert (and (=> killerAgatha AgathaHatesAgatha) (=> killerButler ButlerHatesAgatha) (=> killerCharles CharlesHatesAgatha)))
(assert (and (=> killerAgatha (not AgathaRicherAgatha)) (=> killerButler (not ButlerRicherAgatha)) (=> killerCharles (not CharlesRicherAgatha))))
(assert (and (=> AgathaHatesAgatha (not CharlesHatesAgatha)) (=> AgathaHatesButler (not CharlesHatesButler)) (=> AgathaHatesCharles (not CharlesHatesCharles))))
(assert (and AgathaHatesAgatha AgathaHatesCharles (not AgathaHatesButler)))
(assert (and (=> AgathaRicherAgatha ButlerHatesAgatha) (=> AgathaRicherButler ButlerHatesButler) (=> AgathaRicherCharles ButlerHatesCharles)))
(assert (and (=> AgathaHatesAgatha ButlerHatesAgatha) (=> AgathaHatesButler ButlerHatesButler) (=> AgathaHatesCharles ButlerHatesCharles)))
(assert (not (and AgathaHatesAgatha AgathaHatesButler AgathaHatesCharles)))
(assert (not (and ButlerHatesAgatha ButlerHatesButler ButlerHatesCharles)))
(assert (not (and CharlesHatesAgatha CharlesHatesButler CharlesHatesCharles)))

(check-allsat (killerAgatha killerButler killerCharles))
(get-model)
(exit)