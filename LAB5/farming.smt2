(set-option :produce-models true)

(declare-const add_tree Int)
(declare-const num_apples Int)

(assert (= num_apples (+ (* 50 800) (* add_tree (- 800 (* add_tree 10))))))

(maximize num_apples)


(check-sat)
(get-objectives)
(get-model)
(exit)
