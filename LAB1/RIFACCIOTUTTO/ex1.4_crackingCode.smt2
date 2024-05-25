;1,2: one number is correct and well placed
;1,4 nothing is correct
;4,3 one number is correct but wrong placed
(set-option :produce-models true)

(declare-const X1 Bool);1 nella prima posizione
(declare-const Y1 Bool);1 nella seconda posizione

(declare-const X2 Bool)
(declare-const Y2 Bool)

(declare-const X3 Bool)
(declare-const Y3 Bool)

(declare-const X4 Bool)
(declare-const Y4 Bool)

;1,2: one number is correct and well placed
(assert (or X1 Y2))

;1,4 nothing is correct
(assert (and (not X1) (not Y4)))
(assert (and (not Y1) (not X4)))

;4,3 one number is correct but wrong placed
(assert (xor Y4 X3))

;in ogni posizione almeno un numero 
(assert (or X1 X2 X3 X4))
(assert (or Y1 Y2 Y3 Y4))

;in ogni posizione al massimo un numero 
(assert (=> X1 (and (not X2) (not X3) (not X4))))
(assert (=> Y1 (and (not Y2) (not Y3) (not Y4))))

(assert (=> X2 (and (not X1) (not X3) (not X4))))
(assert (=> Y2 (and (not Y1) (not Y3) (not Y4))))

(assert (=> X3 (and (not X1) (not X2) (not X4))))
(assert (=> Y3 (and (not Y1) (not Y2) (not Y4))))

(assert (=> X4 (and (not X1) (not X2) (not X3))))
(assert (=> Y4 (and (not Y1) (not Y2) (not Y3))))

(check-sat)
(get-model)

(assert (and (not Y2) (not X3)))
(check-sat)
(get-model)
(exit)