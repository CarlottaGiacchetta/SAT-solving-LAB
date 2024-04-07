(set-option :produce-models true)

(define-const x1y0 Int 9)
(define-const x2y0 Int 26)
(define-const x3y0 Int 4)

(define-const x0y1 Int 9)
(declare-const x1y1 Int )
(declare-const x2y1 Int )
(declare-const x3y1 Int )

(define-const x0y2 Int 13)
(declare-const x1y2 Int )
(declare-const x2y2 Int )
(declare-const x3y2 Int )

(define-const x0y3 Int 13)
(declare-const x1y3 Int )
(declare-const x2y3 Int )
(define-const x3y3 Int 11)
(define-const x4y3 Int 4)

(define-const  x1y4 Int 7)
(declare-const x2y4 Int )
(declare-const x3y4 Int )
(declare-const x4y4 Int )

(define-const  x1y5 Int 6)
(declare-const x2y5 Int )
(declare-const x3y5 Int )
(declare-const x4y5 Int )

;numeri compresi da 1 a 9
(assert (and (<=  x1y1 9 ) (>= x1y1 1)))
(assert (and (<=  x2y1 9 ) (>= x2y1 1)))
(assert (and (<=  x3y1 9 ) (>= x3y1 1)))

(assert (and (<=  x1y2 9 ) (>= x1y2 1)))
(assert (and (<=  x2y2 9 ) (>= x2y2 1)))
(assert (and (<=  x3y2 9 ) (>= x3y2 1)))

(assert (and (<=  x1y3 9 ) (>= x1y3 1)))
(assert (and (<=  x2y3 9 ) (>= x2y3 1)))

(assert (and (<=  x2y4 9 ) (>= x2y4 1)))
(assert (and (<=  x3y4 9 ) (>= x3y4 1)))
(assert (and (<=  x4y4 9 ) (>= x4y4 1)))

(assert (and (<=  x2y5 9 ) (>= x2y5 1)))
(assert (and (<=  x3y5 9 ) (>= x3y5 1)))
(assert (and (<=  x4y5 9 ) (>= x4y5 1)))

;non posso ripetere i numeri nelle righe e nelle colomne
;per riga
(assert (distinct x1y1 x2y1 x3y1))
(assert (distinct x1y2 x2y2 x3y2))
(assert (distinct x1y3 x2y3))
(assert (distinct  x2y4 x3y4 x4y4))
(assert (distinct  x2y5 x3y5 x4y5))
;per colonna
(assert (distinct x1y1 x1y2 x1y3))
(assert (distinct x2y1 x2y2 x2y3 x2y4 x2y5))
(assert (distinct x3y1 x3y2 ))
(assert (distinct x3y4 x3y5 ))
(assert (distinct x4y4 x4y5 ))

;le somme devono essere rispettate sia per riga che per colonna
;per riga
(assert (= x0y1 (+ x1y1 x2y1 x3y1)))
(assert (= x0y2 (+ x1y2 x2y2 x3y2)))
(assert (= x0y3 (+ x1y3 x2y3)))
(assert (= x1y4 (+ x2y4 x3y4 x4y4)))
(assert (= x1y5 (+ x2y5 x3y5 x4y5)))
;per colonne
(assert (= x1y0 (+ x1y1 x1y2 x1y3)))
(assert (= x2y0 (+ x2y1 x2y2 x2y3 x2y4 x2y5)))
(assert (= x3y0 (+ x3y1 x3y2)))
(assert (= x3y3 (+ x3y4 x3y5)))
(assert (= x4y3 (+ x4y4 x4y5)))


(check-sat)
(get-model)
(exit)