;Three students A, B and C are accused of having illegally obtained
;the questions for the Automated Reasoning exam. During the
;investigation process the students made the following statements:
;▶ A said: "B is guilty and C is innocent"
;▶ B said: "If A is guilty, then C is also guilty"
;▶ C said: "I’m innocent and one of the others, perhaps even the two, are guilty"
;Considering that all the students spoke the truth, which of the
;students are guilty and which are innocent?
(set-option :produce-models true)
(declare-const AI Bool)
(declare-const BI Bool)
(declare-const CI Bool)

(declare-const AG Bool)
(declare-const BG Bool)
(declare-const CG Bool)

;A said: "B is guilty and C is innocent"
(assert (=> AI (and BG CI)))

;B said: "If A is guilty, then C is also guilty"
(assert (=> BI (=> AG CG)))

;C said: "I’m innocent and one of the others, perhaps even the two, are guilty"
(assert (=> CI (and CI (or AG BG))))

;non possono essere sia guilty che innocent ma devono essere uno dei due 
(assert (xor AI AG))
(assert (xor BI BG))
(assert (xor CI CG))

(check-sat)
(get-model)

;is it unique?
(assert (not CG))
(check-sat)
(get-model)
(exit)