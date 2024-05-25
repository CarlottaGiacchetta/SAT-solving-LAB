;You want to unlock the mobilephone of your friend to see if they
;are dating someone. Sadly, there is a 2*2 grid pattern lock that
;stops you. You remember that the password requires all 4 pins to
;be connected; moreover, there are no diagonal lines in the pattern,
;the order of pins is important and we cannot choose the same pin
;twice (i.e. we cannot have a loop). How many combinations do you
;have to try in the worst case to unlock the sphone? 

(set-option :produce-models true)

(declare-const A Int);in alto a sinistra
(declare-const B Int);in alto a destra
(declare-const C Int);in basso a sinistra
(declare-const D Int);in basso a destra

(assert(and (> A 0) (< A 5)))
(assert(and (> B 0) (< B 5)))
(assert(and (> C 0) (< C 5)))
(assert(and (> D 0) (< D 5)))

;no diagonali (A non può essere il successore di D e viceversa)
(assert (not (= A (+ D 1))))
(assert (not (= D (+ A 1))))
;uguale con B e C
(assert (not (= B (+ C 1))))
(assert (not (= C (+ B 1))))
;non posso usare lo stesso pin due volte
(assert (distinct A B C D))


(check-allsat (
    (= A 1)
    (= A 2)
    (= A 3)
    (= A 4)
    (= B 1)
    (= B 2)
    (= B 3)
    (= B 4)
    (= C 1)
    (= C 2)
    (= C 3)
    (= C 4)
    (= D 1)
    (= D 2)
    (= D 3)
    (= D 4)

));
(get-model)
(exit)