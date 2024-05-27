;A vertex-cover set of an
;undirected graph is a subset of
;vertices such that if an edge
;belongs to the graph, then at
;least one of the two nodes linked
;by this edge belongs to the
;vertex-cover subset. Use
;OptiMathSAT to compute the
;minimum vertex-cover set of the
;graph in the figure.
(set-option :produce-models true)

(declare-const AB Bool)
(declare-const BC Bool)
(declare-const CD Bool)
(declare-const CE Bool)
(declare-const DE Bool)
(declare-const DF Bool)
(declare-const DG Bool)
(declare-const EF Bool)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)
(declare-const E Bool)
(declare-const F Bool)
(declare-const G Bool)

(declare-const count Int)

(assert (= true AB))
(assert (= true BC))
(assert (= true CD))
(assert (= true CE))
(assert (= true DE))
(assert (= true DF))
(assert (= true DG))
(assert (= true EF))

(assert (or (=> AB A) (=> AB B)) )
(assert (or (=> BC B) (=> BC C)))
(assert (or (=> CD C) (=> CD D)))
(assert (or (=> CE C) (=> CE E)))
(assert (or (=> DE D) (=> DE E)))
(assert (or (=> DF D) (=> DF F)))
(assert (or (=> DG D) (=> DG G)))
(assert (or (=> EF E) (=> EF F)))



(assert (> count 0))
(assert (= count (+ (ite A 1 0) (ite B 1 0) (ite C 1 0) (ite D 1 0) (ite E 1 0) (ite F 1 0) (ite G 1 0))))
(minimize count)

(check-sat)
(get-objectives)
(get-model)
(exit)


