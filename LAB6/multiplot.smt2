(set-option :produce-models true)

(declare-const num_adCamp Int)
(declare-const num_PA Int)
(declare-const new_customers Int)
(declare-const positive_ratings Int)

(declare-const cost Int)
(declare-const time Int)

(assert (and (> num_adCamp 0) (> num_PA 0)))

(assert (= new_customers (+ (* 2 num_adCamp) (* 2 num_PA))))
(assert (= positive_ratings (+ (* 1 num_adCamp) (* 5 num_PA))))

(assert (and (>= new_customers 16) (>= positive_ratings 28)))

(assert (= cost (+ (* 2000 num_adCamp) (* 500 num_PA))))
(assert (= time (+ (* 1 num_adCamp) (* 2 num_PA))))

(minimize cost)
(minimie time)


(check-sat)
(get-objectives)
(get-model)
(exit)