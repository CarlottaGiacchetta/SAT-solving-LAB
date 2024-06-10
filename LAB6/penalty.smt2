(set-option :produce-models true)

(declare-const AR Bool)
(declare-const BR Bool)
(declare-const CR Bool)
(declare-const DR Bool)
(declare-const value Int)

(define-fun min ((A Int) (B Int)) Int (ite (<= A B) A B))
(define-fun ExactlyOne ((A Bool) (B Bool) (C Bool) (D Bool)) Int (+ (ite A 1 0) (ite B 1 0) (ite C 1 0) (ite D 1 0)))

(assert (=> AR (= value (min 4 (min 3 (min 2 5))))))
(assert (=> BR (= value (min (- 0 10) (min 2 (min 0 (- 0 1)))))))
(assert (=> CR (= value (min 7 (min 5 (min 2 3))))))
(assert (=> DR (= value (min 0 (min 8 (min (- 0 4) (- 0 5)))))))

(assert (= 1 (ExactlyOne AR BR CR DR)))
(maximize value)




(check-sat)
(get-objectives)
(get-model)
(exit)