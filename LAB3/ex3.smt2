; Find the number of positive integers with three not necessarily
;distinct digits, abc, with a ̸= 0 and c ̸= 0 such that both abc and
;cba are multiples of 4.
(set-option :produce-models true)

;numeri abc, CbA 
(declare-const a Int)
(declare-const A Int)
(declare-const b Int)
(declare-const y Int)
(declare-const c Int)
(declare-const C Int)

(declare-const num Int)
(declare-const num1 Int)


;i numeri possono essere compresi tra 1,9 mentre y tra 0,9
(assert  (>= A 1))
(assert  (<= A 9))
(assert (= a (* A 100)))

(assert  (>= A 1));sarebbe x1
(assert  (<= A 9))


(assert  (>= y 0))
(assert  (<= y 9))
(assert (= b (* y 10)))


(assert  (>= c 1)); sarebbe z
(assert  (<= c 9))
(assert (= C (* c 100)))


;definisco i numeri 
(assert (= num (+ a b c)))
(assert (= num1 (+ C b A)))

;controllo che abc e CBA siano entrambi divisibili per 4
(assert (= num (* 4 (div num 4))))
(assert (= num1 (* 4 (div num1 4))))

(check-sat)
(get-model)

;proviamo a mettere come condizione che a è diverso da c 
(assert (not (= c A)))
(check-sat)
(get-model)
(exit)




