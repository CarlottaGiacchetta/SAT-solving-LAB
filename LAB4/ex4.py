from pysmt.shortcuts import *
solver = Solver()
#rifai da capo su smt2
n = 5
A = Int()
B = Int()
C = Int()
D = Int()
E = Int()

list = [A, B, C, D, E]

for const in list:
    solver.add_assertion(And (GE (const, 0), (LE (const, 9))))

solver.add_assertion(ExactlyOne(A, B, C, D, E))

num = A*10000+B*1000+C*100+D*10+E
security = Int(4)

solver.add_assertion(Iff(()))

    