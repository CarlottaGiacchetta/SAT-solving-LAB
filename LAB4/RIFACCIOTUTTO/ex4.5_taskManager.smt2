;Your PC need  tocomplete5differenttasks(A,B,C,DandE)to
;correctlysaveafile.Therearesomeconstraintsabouttheorder
;executionof thetasks:
;▶WecanexecuteAafterDiscompleted.
;▶WecanexecuteBafterCandEarecompleted.
;▶WecanexecuteEafterBorDarecompleted.
;▶WecanexecuteCafterAiscompleted.
;Whichisthetaskthatwillexecutefor las

(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)

(assert (and (> a 0) (< a 6)))
(assert (and (> b 0) (< b 6)))
(assert (and (> c 0) (< c 6)))
(assert (and (> d 0) (< d 6)))
(assert (and (> e 0) (< e 6)))

(assert (> a d ))
(assert (and (> b c) (> b e)))
(assert (or (> e b) (> e d)))
(assert (> c a))

(assert (distinct a b c d e))
(check-sat)
(get-model)
(exit)