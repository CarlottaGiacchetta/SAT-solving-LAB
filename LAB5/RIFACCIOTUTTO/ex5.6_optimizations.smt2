;Findtwonon-negativenumbersxandy sothat:
;▶Theirsumis9.
;▶Theproductofonenumberandthesquareof theother
;number isamaximumintherange(0,200).
(set-option :produce-models true)

(declare-const x Int)
(declare-const y Int)

(declare-const cost_func Int)

(assert (> x 0))
(assert (> y 0))

(assert (= 9 (+ x y)))
(assert (= cost_func (* x y y)))
(assert (and (> cost_func 0) (<= cost_func 200)))
(maximize cost_func)

(check-sat)
(get-objectives)
(get-model)
(exit)
