;Bill has a series of job interviews this week (August20th,21st,
;22nd,and23rd), each for a different type of position (copywriter,
;graphic design, sale srep, and social media) at a different company
;(AlphaPlus, Laneplex, Sancode, Streeter Inc.). Using only the
;clues below, match each job position to its company, and determine
;the day for each interview and the town it will beheld in. No
;option in any category can be used more than once.

(set-option :produce-models true)
;day-August20th
(declare-const D0CA  Bool);day-August20th, Copywriter, AlphaPlus
(declare-const D0CL  Bool);day-August20th, Copywriter, Laneplex
(declare-const D0CS  Bool);day-August20th, Copywriter, Sancode
(declare-const D0CSI Bool);day-August20th, Copywriter, StreeterInc.

(declare-const D0GA  Bool); graphig design
(declare-const D0GL  Bool); graphig design
(declare-const D0GS  Bool); graphig design
(declare-const D0GSI Bool) ; graphig design

(declare-const D0SsA  Bool)
(declare-const D0SsL  Bool)
(declare-const D0SsS  Bool)
(declare-const D0SsSI Bool)

(declare-const D0SmA  Bool)
(declare-const D0SmL  Bool)
(declare-const D0SmS  Bool)
(declare-const D0SmSI Bool)

;day-August21th
(declare-const D1CA  Bool)
(declare-const D1CL  Bool)
(declare-const D1CS  Bool)
(declare-const D1CSI Bool)

(declare-const D1GA  Bool)
(declare-const D1GL  Bool)
(declare-const D1GS  Bool)
(declare-const D1GSI Bool) 

(declare-const D1SsA  Bool)
(declare-const D1SsL  Bool)
(declare-const D1SsS  Bool)
(declare-const D1SsSI Bool)

(declare-const D1SmA  Bool)
(declare-const D1SmL  Bool)
(declare-const D1SmS  Bool)
(declare-const D1SmSI Bool)

;day-August22th
(declare-const D2CA  Bool)
(declare-const D2CL  Bool)
(declare-const D2CS  Bool)
(declare-const D2CSI Bool)

(declare-const D2GA  Bool)
(declare-const D2GL  Bool)
(declare-const D2GS  Bool)
(declare-const D2GSI Bool) 

(declare-const D2SsA  Bool)
(declare-const D2SsL  Bool)
(declare-const D2SsS  Bool)
(declare-const D2SsSI Bool)

(declare-const D2SmA  Bool)
(declare-const D2SmL  Bool)
(declare-const D2SmS  Bool)
(declare-const D2SmSI Bool)

;The Alpha Plus interview is 2 days before the meeting for the  copywriter position
(assert (and (or D0GA D0SsA D0SmA) (or D2CL D2CS D2CSI)))
(assert (and (not D0CA) (not (D2CA))))

;The meeting for the graphic design position is sometime after the Sancode interview
()