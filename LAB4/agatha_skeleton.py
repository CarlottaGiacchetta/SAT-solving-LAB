from pysmt.shortcuts import *

# Support variables for readibility
n = 3
agatha = Int(0)
butler = Int(1)
charles = Int(2)

victim = agatha

solver = Solver()

who = ["agatha","butler","charles"]

killer = Symbol("killer", INT)

fu = FunctionType(BOOL, [INT, INT])

hates = Symbol("hates", fu)
richer = Symbol("richer", fu)

# Agatha, the butler, and Charles live in Dreadsbury Mansion, and 
# are the only ones to live there. So the killer must be among them.
solver.add_assertion((And (GE (killer, Int(0)), LE (killer, Int(2)))))

# A killer always hates, and is no richer than his victim. 
solver.add_assertion(Function(hates, [killer,victim])) # Hint: how to use functions!
solver.add_assertion((Not (Function(richer, [killer,victim]))))


# Hidden condition: no one is richer than him-/herself (non-reflexivity)
for i in range(n):
    solver.add_assertion((Not (Function(richer, [Int(i),Int(i)]))))

# Hidden condition: if i is richer than j then j is not richer than i (non-simmetry)
for i in range(n):
    for j in range(n):
        if i != j:
            solver.add_assertion(Iff((Function(richer, [Int(i),Int(j)])),(Not(Function(richer, [Int(j),Int(i)])))))

#Charles hates no one that Agatha hates. 
for i in range(n):
    solver.add_assertion(Iff((Function(hates, [Int(0),Int(i)])), (Not(Function(hates, [Int(2), Int(i)])))))


# Agatha hates everybody except the butler.
for i in range(n):
    if i == 1:
        solver.add_assertion(Not(Function(hates, [Int(0),Int(i)])))
    else: 
        solver.add_assertion(Function(hates, [Int(0),Int(i)]))

# The butler hates everyone not richer than Aunt Agatha. 
for i in range(n):
    solver.add_assertion(Iff((Not(Function(richer, [Int(0),Int(i)]))), (Function(hates,[Int(1), Int(i)]))))

# The butler hates everyone whom Agatha hates. 
for i in range(n):
    solver.add_assertion(Iff((Function(hates, [Int(0), Int(i)])), (Function(hates,[Int(1), Int(i)]))))

# No one hates everyone. 
for i in range(n):#create a counter, if the counter is grather than 1 it is fine
    solver.add_assertion(Plus([Ite(Function(hates, [Int(i), Int(j)]), Int(1), Int(0)) for j in range(n)]) < Int(3))


# Who killed Agatha? 
num_solutions = 0

while solver.solve():
    num_solutions += 1
    sat_model = {el[0].symbol_name():el[1] for el in solver.get_model()}
    print(sat_model)
    solver.add_assertion(Not(Equals(killer, sat_model['killer'])))
        
print("num_solutions:", num_solutions)