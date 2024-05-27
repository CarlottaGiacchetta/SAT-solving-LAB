;Use MathSAT to solve the puzzle
;shown in the figure. The rules are
;simple: you must connect dots
;with the same color with a single
;line and all cells must be used to
;generate a valid solution.

(set-option :produce-models true)

(declare-const x11 Int)
(declare-const x12 Int)
(declare-const x13 Int)
(declare-const x14 Int)
(declare-const x15 Int)

(declare-const x21 Int)
(declare-const x22 Int)
(declare-const x23 Int)
(declare-const x24 Int)
(declare-const x25 Int)

(declare-const x31 Int)
(declare-const x32 Int)
(declare-const x33 Int)
(declare-const x34 Int)
(declare-const x35 Int)

(declare-const x41 Int)
(declare-const x42 Int)
(declare-const x43 Int)
(declare-const x44 Int)
(declare-const x45 Int)

(declare-const x51 Int)
(declare-const x52 Int)
(declare-const x53 Int)
(declare-const x54 Int)
(declare-const x55 Int)


(assert (= 1 x11))
(assert (= 1 x54))

(assert (= 2 x12))
(assert (= 2 x33))

(assert (= 3 x24))
(assert (= 3 x32))

(assert (= 4 x42))
(assert (= 4 x55))

(assert (and (>= x13 0) (<= x13 4)))
(assert (and (>= x14 0) (<= x14 4)))
(assert (and (>= x15 0) (<= x15 4)))

(assert (and (>= x21 0) (<= x21 4)))
(assert (and (>= x22 0) (<= x22 4)))
(assert (and (>= x23 0) (<= x23 4)))
(assert (and (>= x25 0) (<= x25 4)))

(assert (and (>= x31 0) (<= x31 4)))
(assert (and (>= x34 0) (<= x34 4)))
(assert (and (>= x35 0) (<= x35 4)))

(assert (and (>= x41 0) (<= x41 4)))
(assert (and (>= x43 0) (<= x43 4)))
(assert (and (>= x44 0) (<= x44 4)))
(assert (and (>= x45 0) (<= x45 4)))

(assert (and (>= x51 0) (<= x51 4)))
(assert (and (>= x52 0) (<= x52 4)))
(assert (and (>= x53 0) (<= x53 4)))


;definisco le funzioni utili 
;quelli cdi cui so già il colore devono avere solo un vicino colorato perchè è lo starting7end point
(define-fun ExactlyOne-corner ((n Int) (x1 Int) (x2 Int)) Bool (= 1 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0))))
(define-fun ExactlyOne-border ((n Int) (x1 Int) (x2 Int) (x3 Int)) Bool (= 1 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0) (ite (= n x3) 1 0)) ))
(define-fun ExactlyOne-middle ((n Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int)) Bool (= 1 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0) (ite (= n x3) 1 0) (ite (= n x4) 1 0))))
;quelli cdi cui sonon so il colore devono avere due vicini dello stesso colore perchè il path deve andare avanti
(define-fun ExactlyTwo-corner ((n Int) (x1 Int) (x2 Int)) Bool (= 2 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0))))
(define-fun ExactlyTwo-border ((n Int) (x1 Int) (x2 Int) (x3 Int)) Bool (= 2 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0) (ite (= n x3) 1 0)) ))
(define-fun ExactlyTwo-middle ((n Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int)) Bool (= 2 (+ (ite (= n x1) 1 0) (ite (= n x2) 1 0) (ite (= n x3) 1 0) (ite (= n x4) 1 0))))

;prima ragiono su tutti i punti che hanno già un colore 
(assert (ExactlyOne-corner x11 x12 x21))
(assert (ExactlyOne-border x12 x11 x13 x22))
(assert (ExactlyOne-border x54 x53 x55 x44))
(assert (ExactlyOne-corner x55 x54 x45))
(assert (ExactlyOne-middle x24 x25 x23 x14 x34))
(assert (ExactlyOne-middle x32 x33 x31 x22 x42))
(assert (ExactlyOne-middle x33 x34 x32 x23 x43))
(assert (ExactlyOne-middle x42 x41 x43 x32 x52))

;tutti i punti della griglia a cui manca un colore 
(assert (ExactlyTwo-corner x15 x14 x25))
(assert (ExactlyTwo-corner x51 x41 x52))

(assert (ExactlyTwo-border x13 x12 x14 x23))
(assert (ExactlyTwo-border x14 x15 x13 x24))

(assert (ExactlyTwo-border x21 x11 x31 x22))
(assert (ExactlyTwo-border x31 x21 x41 x32))
(assert (ExactlyTwo-border x41 x31 x51 x42))

(assert (ExactlyTwo-border x25 x15 x35 x24))
(assert (ExactlyTwo-border x35 x25 x45 x34))
(assert (ExactlyTwo-border x45 x35 x55 x44))

(assert (ExactlyTwo-border x52 x51 x53 x42))
(assert (ExactlyTwo-border x53 x54 x52 x43))

(assert (ExactlyTwo-middle x22 x23 x21 x12 x32))
(assert (ExactlyTwo-middle x23 x24 x22 x13 x33))
(assert (ExactlyTwo-middle x34 x33 x35 x24 x44))
(assert (ExactlyTwo-middle x43 x42 x44 x33 x53))
(assert (ExactlyTwo-middle x44 x43 x45 x34 x54))

(check-sat)
(get-model)
(exit)