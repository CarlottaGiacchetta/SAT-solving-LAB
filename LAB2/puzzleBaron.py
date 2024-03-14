from pysmt.shortcuts import *


# Creating dictionary to store variables
sports_arena = {"sa{}{}".format(i,j): Symbol("ts{}{}".format(i,j), BOOL) for i in 'bfhrs' for j in "clopv"}
sports_capacities = {"sc{}{}".format(i,j): Symbol("tw{}{}".format(i,j), BOOL) for i in 'bfhrs' for j in [110,150,190,230,270]} 


# We merge both dictionary into one
var = {**sports_arena, **sports_capacities}


msat = Solver(name="z3")

#1. The football facility is either Vazquez Arena or Lewis Arena.
msat.add_assertion(Or(var['safv'], var['safl']))


#2. Of the basketball facility and the facility with seating for 270 people, one is Cantu Arena and the other is Pierce Arena.
msat.add_assertion(And(var['scb270'], var['sabc'], var['sabp'] ))


#3. The facility with seating for 270 people is set up for soccer games.
msat.add_assertion(var['scs270'])

#4. The arena with seating for 110 people is either the basketball facility or Vazquez Arena.
serie_di_and = []
for i in 'bfhrs':
  serie_di_and.append(And(var['sc{}110'.format(i)], var['sa{}v'.format(i)]))
msat.add_assertion(Or(var['scb110'], *serie_di_and))


#5. Lewis Arena holds fewer people than the hockey facility.
serie_sport = []
serie_capacity = []

for sport in 'bfrs':
  serie_di_and.append(And(var['sa{}l'.format(sport)], [var['sc{}{}'.format(capacity)] for capacity in [110,150,190,230,270]]))

for capacity in [110,150,190,230,270]:
  




msat.add_assertion(Or([var['sch{}'.format(sport)]], *serie_di_and))

#6. Ortiz Arena holds 120 fewer people than Pierce Arena.

# Each day must be associated to exactly one company
for i in range(0,4):
  msat.add_assertion(ExactlyOne([var["dc{}{}".format(i, j)] for j in "alsi"]))

# Each day must be associated to exactly one role
for i in range(0,4):
  msat.add_assertion(ExactlyOne([var["dr{}{}".format(i, j)] for j in "cgrm"]))  

# Each company must be associated to exactly one day
for j in "alsi":
  msat.add_assertion(ExactlyOne([var["dc{}{}".format(i, j)] for i in range(0,4)]))

# Each role must be associated to exactly one day
for j in "cgrm":
  msat.add_assertion(ExactlyOne([var["dr{}{}".format(i, j)] for i in range(0,4)]))


# Optional (but strongly suggested): prettify the results
companies = {"a": "Alpha Plus", "l":"Laneplex", "s": "Sancode", "i": "Streeter Inc."}
roles = {"c": "copywriter", 'g':'graphic design', 'r':'sales rep', 'm': 'social media'}

exit()
res = msat.solve()
if res:
  sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
  for i in range(0,4):
    for j in "alsi":
      if sat_model["dc{}{}".format(i,j)] == Bool(True):
        final_answer[i] = final_answer[i] + companies[j] + " - "
    for j in "cgrm":
      if sat_model["dr{}{}".format(i,j)] == Bool(True):
        final_answer[i] = final_answer[i] + roles[j]
  print("\n".join(final_answer))
else:
  print("UNSAT")

# OPTIONAL: is the solution unique?

msat.add_assertion(Not(And(var["dc0a"], var["dc1s"], var["dc2i"], var["dc3l"], var["dr0r"], var["dr1m"], var["dr2c"], var["dr3g"])))

final_answer = ["20th: ", "21st: ", "22nd: ", "23rd: "]

res = msat.solve()
if res:
  sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
  for i in range(0,4):
    for j in "alsi":
      if sat_model["dc{}{}".format(i,j)] == Bool(True):
        final_answer[i] = final_answer[i] + companies[j] + " - "
    for j in "cgrm":
      if sat_model["dr{}{}".format(i,j)] == Bool(True):
        final_answer[i] = final_answer[i] + roles[j]
  print("\n".join(final_answer))
else:
  print("UNSAT")