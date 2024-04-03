(set-option :produce-models true)
;SE NON VA METTI -optimization=true (NELLA LINEA DI COMANDO) 
(declare-const apple Int)
(declare-const tree Int)

;(declare-fun n_tree () Int (+ 50 tree))
;(declare-fun apples_per_tree () Int (- 800 (* 10 tree)))

(define-const cost  ())

(maximize (- (* 800 (+ 50 tree)) (* 10 tree)))


(check-sat)
(get-objectives)
(get-model)
(exit)