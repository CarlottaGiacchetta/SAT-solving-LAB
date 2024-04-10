(set-option :produce-models true)
;(set-option :opt.priority lex)
;(set-option :opt.priority pareto)
(set-option :opt.priority box)


(define-const ad_camp_cost Int 2000)
(define-const ad_camp_new_cust Int 2)
(define-const ad_camp_pos_rating Int 1) ;al mese
(define-const ad_camp_time Int 2);ore in 1 mese

(define-const pers_app_cost Int 500)
(define-const pers_app_new_cust Int 2)
(define-const pers_app_pos_rating Int 5)
(define-const pers_app_time Int 1)

(declare-const ad_camp Int)
(declare-const pers_app Int)
(declare-const cost Int)
(declare-const time Int)

(assert (> ad_camp 0 ))
(assert (> pers_app 0 ))

(assert (> (+ (* 2 ad_camp) (* 2 pers_app)) 15))

(assert (> (+ (* 1 ad_camp) (* 5 ad_camp)) 27))


(assert (= cost (+ (* ad_camp_cost ad_camp) (* pers_app_cost pers_app))))
(assert (= time (+ (* 1 ad_camp) (* 2 pers_app))))

(minimize cost)
(minimize time)

(check-sat)
(get-objective)


(check-sat)
(get-model)
(exit)
