;Given two points in the Euclidean space (i.e.A(1,3) and B(2,7)),
;let’s define an encoding to determine the lines passing from both
;points and the value x where the line intersects the x-axis.

(set-option :produce-models true)

;deifnisco punto A
(declare-const XA Real)
(declare-const YA Real)
;deifnisco punto B
(declare-const XB Real)
(declare-const YB Real)

(declare-const m Real)
(declare-const q Real)
(declare-const y Real)
(declare-const x Real)

(define-fun retta ((m Real) (q Real) (y Real)) Real (/ (- y q) m))

(assert (= XA 1))
(assert (= YA 3))
(assert (= XB 2))
(assert (= YB 7))
;voglio trovare l'intersezione della retta con l'asse x
(assert (= y 0))

(assert (= m (/ (- YA YB) (- XA XB))))
(assert (= q (- YA (* m XA))))

(assert (= x (retta m q y)))


(check-sat)
(get-model)
(exit)