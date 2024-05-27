;You want to access the UniTN database. Sadly the server is
;protected by a key. From reverse engineering you obtain the
;following part of code executed by the machine:
;% Key is the concat of 3 32-bit numbers a,b and c
;assert(isMultiple(a,5))
;assert(or(a,b) == 2022))
;assert(a- b > 1000)
;assert(isAverage(c, [a,b]))
;assert(c<0x76543210)
;login()

(set-option :produce-models true)

(declare-const A (_ BitVec 32))
(declare-const B (_ BitVec 32))
(declare-const C (_ BitVec 32))
;assert(isMultiple(a,5))
(assert (= (_ bv0 32) (bvurem A (_ bv5 32))))
;assert(or(a,b) == 2022))
(assert (= (_ bv2022 32) (or A B)))
;assert(a- b > 1000)
(assert (bvugt (bvsub A B) (_ bv1000 32)))
;assert(isAverage(c, [a,b]))
(assert (= C (bvudiv (bvadd A B) (_ bv2 32))))
;assert(c<0x76543210)
(assert (bvult c #x76543210))

(check-sat)
(get-model)
(exit)