(set-option :produce-models true)
;balance puzzle

;variabile z,w,i con pesi incogniti
(declare-const z Int)
(declare-const w Int)
(declare-const i Int)
;variabili p1,p2,p3,p4 con pesi fissi
(declare-const p1 Int)
(declare-const p2 Int)
(declare-const p3 Int)
(declare-const p4 Int)
;valore incognito e che devo trovare
(declare-const p5 Int)

;valori possibili per z,w,i,p5
(assert  (>= z 1))
(assert  (<= z 9))
(assert  (>= w 1))
(assert  (<= w 9))
(assert  (>= i 1))
(assert  (<= i 9))
(assert  (or (= p5 1) (= p5 2) (= p5 3) (= p5 5)))



;assegniamo valori a p1,p2,p3,p4
(assert (= p1 1))
(assert (= p2 2))
(assert (= p3 3))
(assert (= p4 5))

;bilanciamneto
(assert (= (+ z z p2) (+ w i i)));prima bilancia 
(assert (= (+ w p1) (+ i p1 z i)));seocnda bilancia 
(assert (= (+ i p4 z) (+ w w)));terza bilancia 
(assert (= (+ w i z) (+ p2 p5)));quarta bilancia


(check-sat)
(get-model)

;valore diverso per le varie lettere
(assert (distinct z w i) )

(check-sat)
(get-model)
(exit)