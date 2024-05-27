; There are 50 apple trees in an orchard. Each tree produces 800
;pples. For each additional tree planted in the orchard, the output
;per tree drops by 10 apples. How many trees should be added to
;the existing orchard in order to maximize the total output of apples?

(set-option :produce-models true)

(declare-const n_mele Int)
(declare-const new_alberi Int)

(assert (= n_mele (* (+ 50 new_alberi) (- 800 (* 10 new_alberi)))))

(maximize n_mele)

(check-sat)
(get-objectives)
(get-model)
(exit)