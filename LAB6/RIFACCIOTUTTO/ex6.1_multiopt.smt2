;Asmallbusinessadvertisesthroughtraditionalmediaandpersonal
;appearances. Eachadcampaignintraditionalmediacostsabout
;$2000,generating2newcustomersand1positiveratingper
;month. Eachpersonalappearancecosts$500,generating2new
;customersand5positiveratings.Moreover, supposeeachpersonal
;appearancetakes2hoursandeachadcampaigntakes1hour.The
;companywantsat least16newcustomersand28positiveratings
;permonth.TrytominimizeBOTHcostsandtime.
(set-option :produce-models true)

(declare-const traditionalMedia Int)
(declare-const personalappearence Int)
(declare-const customer Int)
(declare-const positiveRatings Int)

(declare-const time Int)
(declare-const cost Int)

(assert (> traditionalMedia 0))
(assert (> personalappearence 0))

(assert (= customer (+ (* 2 traditionalMedia) (* 2 personalappearence))))
(assert (= positiveRatings (+ traditionalMedia (* 5 personalappearence))))
(assert (>= customer 16))
(assert (>= positiveRatings 28))


(assert (= time (+ traditionalMedia (* 2 personalappearence))))
(assert (= cost (+ (* 2000 traditionalMedia) (* 500 personalappearence))))

(minimize cost)
(minimize time)

(check-sat)
(get-objectives)
(get-model)
(exit)