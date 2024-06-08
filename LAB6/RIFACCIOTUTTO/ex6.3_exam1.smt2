(set-option :produce-models true)

(declare-const B1 Int);faccio due beagles perchè vogliono 2 ore
(declare-const B2 Int)

(declare-const ACDC1 Int)
(declare-const ACDC2 Int)
(declare-const ACDC3 Int)

(declare-const RS Int)

(declare-const KW Int)

(declare-const funcost Int)

;(define-fun conditons (c Bool) Int (ite c 1 0))

(assert (and (>= B1 0) (<= B1 6)))
(assert (and (>= ACDC1 1) (<= ACDC2 6)))
(assert (and (>= ACDC2 1) (<= ACDC2 6)))
(assert (and (>= ACDC3 1) (<= ACDC3 6)))
(assert (and (>= RS 0) (<= RS 6)))
(assert (and (>= KW 0) (<= KW 6)))

(assert (distinct B1 B2 ACDC1 ACDC2 ACDC3 RS KW))

(assert (= B2 (+ B1 1)))
(assert (= ACDC2 (+ ACDC1 1)))
(assert (= ACDC3 (+ ACDC1 2)))

(assert (or (= B1 2) (= B1 5) (= B1 0)))
(assert (or (= RS 1) (= RS 6) (= RS 0)))
(assert (and (not (= KW 1)) (not (= KW 6))))

(assert (= funcost (+ (ite (or (= B1 2) (= B1 5)) 1 0) (ite (or (= B2 3) (= B2 6)) 1 0) (ite (or (= RS 1) (= RS 6)) 1 0) (ite (and (not (= KW 1)) (not (= KW 6)) (not (= KW 0))) 1 0 )) ))


;(assert (= funcost (+ conditons((or (= B1 2) (= B1 5))) conditons(or (= B2 3) (= B2 6)) conditons(or (= RS 1) (= RS 6)) conditons(and (not (= KW 1)) (not (= KW 6)))  )) )

(maximize funcost)

(check-sat)
(get-objectives)
(get-model)
(exit)
