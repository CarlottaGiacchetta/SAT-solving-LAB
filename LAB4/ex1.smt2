(set-option :produce-models true)

(declare-const a (_ BitVec 32))
(declare-const b (_ BitVec 32))
(declare-const c (_ BitVec 32))

(assert (= (_ bv0 32) (bvurem a (_ bv5 32))))
(assert (= (_ bv2022 32) (bvor a b)))
(assert (bvugt (bvsub a b ) (_ bv1000 32)))
(assert (= c (bvdiv (bvadd a b ) (_ bv2 32))))
(assert (bvult c #x76543210))

;(declare-fun isMultiple ((a _ BitVec 32) (b _ BitVec 32)) Bool (= a (* b (bvudiv a b))))

;(declare-fun isMultiple ((a _ BitVec 32) (b _ BitVec 32)) Bool (= a (* b (bvudiv a b))))

(check-sat)
(get-model)
(exit)


