import itertools as it
file = open("inputd16.txt")
#file = open("test.txt")
lines = file.readlines()

rules = []
tickets = []
f = False
for line in lines:
    line = line.strip("\n")
    if ":" in line:
        line = line[line.index(":")+1:].strip(" ")
        line = [[int(y) for y in x.split("-")] for x in line.split(" or ")]
        rules += line
        continue
    if "nearby" in line:
        f = True
        continue
    if f:
        tickets.append([int(x) for x in line.split(',')])

print(rules)
print(tickets)

# 275

acc = 0
for ticket in tickets:
    for val in ticket:
        valid = False
        for a,b in rules:
            # print(a, b)

            if a < val and val < b:
                valid = True
        if not valid:
            acc += val
print(acc)
# correct 21978




