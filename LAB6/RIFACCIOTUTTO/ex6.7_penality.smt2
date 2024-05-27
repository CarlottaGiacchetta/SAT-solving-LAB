;Suppose you are Rose. You
;choose one character between A
;and D. After your turn also Collin
;chooses one character. Your goal
;is to get the lowest penalty,
;according to the joint choice
;between Collin and yourself.
;Assume also that Collin is your
;worst enemy, and since it is the
;second it will make his choice to
;maximize your penalty. Use
;OptiMathSAT to get the
;minimum penalty.
(set-option :produce-models true)

;rose
(declare-const AR Bool)
(declare-const BR Bool)
(declare-const CR Bool)
(declare-const DR Bool)
;collin
(declare-const AC Bool)
(declare-const BC Bool)
(declare-const CC Bool)
(declare-const DC Bool)

(declare-const penalty Int)

(define-fun ExactlyOne ((A Bool) (B Bool) (C Bool) (D Bool)) Bool (= 1 (+ (ite A 1 0) (ite B 1 0) (ite C 1 0) (ite D 1 0))))
(define-fun min ((A Int) (B Int)) Int (ite (<= A B) A B ))


(assert (=> AC (= penalty (min 4 (min (- 0 10) (min 7 0))))))
(assert (=> BC (= penalty (min 3 (min 2 (min 5 8))))))
(assert (=> CC (= penalty (min 2 (min 0 (min 2 (- 0 4)))))))
(assert (=> DC (= penalty (min 5 (min (- 0 1) (min 3 (- 0 5)))))))

(assert (=> (and AC (= penalty 4)) AR))
(assert (=> (and AC (= penalty 3)) BR))
(assert (=> (and AC (= penalty 2)) CR))
(assert (=> (and AC (= penalty 5)) DR))

(assert (=> (and BC (= penalty (- 0 10))) AR))
(assert (=> (and BC (= penalty 2)) BR))
(assert (=> (and BC (= penalty 0)) CR))
(assert (=> (and BC (= penalty (- 0 1))) DR))

(assert (=> (and CC (= penalty 7)) AR))
(assert (=> (and CC (= penalty 5)) BR))
(assert (=> (and CC (= penalty 2)) CR))
(assert (=> (and CC (= penalty 3)) DR))

(assert (=> (and DC (= penalty 0)) AR))
(assert (=> (and DC (= penalty 8)) BR))
(assert (=> (and DC (= penalty (- 0 4))) CR))
(assert (=> (and DC (= penalty (- 0 5))) DR))

;(assert (=> AR (= penalty (max 4 (max 3 (max 2 5))))))
;(assert (=> BR (= penalty (max (- 0 10) (max 2 (max 0 (- 0 1)))))))
;(assert (=> CR (= penalty (max 7 (max 5 (max 2 3))))))
;(assert (=> DR (= penalty (max 0 (max 8 (max (- 0 4) (- 0 5)))))))
;
;
;(assert (=> (and AR (= penalty 4)) AC))
;(assert (=> (and AR (= penalty 3)) BC))
;(assert (=> (and AR (= penalty 2)) CC))
;(assert (=> (and AR (= penalty 5)) DC))
;
;(assert (=> (and BR (= penalty (- 0 10))) AC))
;(assert (=> (and BR (= penalty 2)) BC))
;(assert (=> (and BR (= penalty 0)) CC))
;(assert (=> (and BR (= penalty (- 0 1))) DC))
;
;(assert (=> (and CR (= penalty 7)) AC))
;(assert (=> (and CR (= penalty 5)) BC))
;(assert (=> (and CR (= penalty 2)) CC))
;(assert (=> (and CR (= penalty 3)) DC))
;
;(assert (=> (and DR (= penalty 0)) AC))
;(assert (=> (and DR (= penalty 8)) BC))
;(assert (=> (and DR (= penalty (- 0 4))) CC))
;(assert (=> (and DR (= penalty (- 0 5))) DC))
;
(assert (ExactlyOne AR BR CR DR))
(assert (ExactlyOne AC BC CC DC))
;
(maximize penalty)
;
(check-sat)
(get-objectives)
(get-model)
(exit)