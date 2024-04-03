(set-option :produce-models true)

(define-const x1y1 Int 1)
(define-const x1y2 Int 2)
(declare-const x1y3 Int )
(declare-const x1y4 Int )
(declare-const x1y5 Int )

(declare-const x2y1 Int )
(declare-const x2y2 Int )
(declare-const x2y3 Int )
(define-const x2y4 Int 3)
(declare-const x2y5 Int )

(declare-const x3y1 Int )
(define-const x3y2 Int 3)
(define-const x3y3 Int 2)
(declare-const x3y4 Int )
(declare-const x3y5 Int )

(declare-const x4y1 Int )
(define-const x4y2 Int 4)
(declare-const x4y3 Int )
(declare-const x4y4 Int )
(declare-const x4y5 Int )

(declare-const x5y1 Int )
(declare-const x5y2 Int )
(declare-const x5y3 Int )
(define-const x5y4 Int 1)
(define-const x5y5 Int 4)

(assert (and (>= x1y1 0) (<= x1y1 4)))
(assert (and (>= x1y2 0) (<= x1y2 4)))
(assert (and (>= x1y3 0) (<= x1y3 4)))
(assert (and (>= x1y4 0) (<= x1y4 4)))
(assert (and (>= x1y5 0) (<= x1y5 4)))

(assert (and (>= x2y1 0) (<= x2y1 4)))
(assert (and (>= x2y2 0) (<= x2y2 4)))
(assert (and (>= x2y3 0) (<= x2y3 4)))
(assert (and (>= x2y4 0) (<= x2y4 4)))
(assert (and (>= x2y5 0) (<= x2y5 4)))

(assert (and (>= x3y1 0) (<= x3y1 4)))
(assert (and (>= x3y2 0) (<= x3y2 4)))
(assert (and (>= x3y3 0) (<= x3y3 4)))
(assert (and (>= x3y4 0) (<= x3y4 4)))
(assert (and (>= x3y5 0) (<= x3y5 4)))

(assert (and (>= x4y1 0) (<= x4y1 4)))
(assert (and (>= x4y2 0) (<= x4y2 4)))
(assert (and (>= x4y3 0) (<= x4y3 4)))
(assert (and (>= x4y4 0) (<= x4y4 4)))
(assert (and (>= x4y5 0) (<= x4y5 4)))

(assert (and (>= x5y1 0) (<= x5y1 4)))
(assert (and (>= x5y2 0) (<= x5y2 4)))
(assert (and (>= x5y3 0) (<= x5y3 4)))
(assert (and (>= x5y4 0) (<= x5y4 4)))
(assert (and (>= x5y5 0) (<= x5y5 4)))


(define-fun ExactlyOne-borde ((x Int) (y1 Int) (y2 Int)) (=1 (+ (ite (= x y1) 1 0) (ite (= x y2) 1 0))))
(define-fun ExactlyOne-borde ((x Int) (y1 Int) (y2 Int) (y3 Int)) (=1 (+ (ite (= x y1) 1 0) (ite (= x y2) 1 0))) )
(define-fun ExactlyOne-borde ((x Int) (y1 Int) (y2 Int) (y3 Int) (y4 Int)) (=1 (+ (ite (= x y1) 1 0) (ite (= x y2) 1 0))))


(check-sat)
(get-model)
(exit)
