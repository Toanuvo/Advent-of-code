
file = open("inputd7.txt")
lines = file.readlines()

rules = {}
for line in lines:
    line = line.strip(".\n")
    line = line.split(" contain ")
    conts = line[1].split(", ")
    for i,v in enumerate(conts):
        conts[i] = v.strip("s").strip(" ")
    line[0] = line[0][:(len(line[0])-1)]
    rules[line[0]] = conts

for line in lines:
    print(line)
def contains(targetbag, curbag):
    if targetbag == curbag:
        return True
    if curbag in rules.keys():
        bags = rules[curbag]
    else: return False
    out = False
    for bag in bags:
        if bag == "no other bag":
            return False
        else:
            bag = bag.split(" ", 1)
            out = out or contains(targetbag, bag[1])


    return out

def containsHowMany(curbag):
    bags = rules[curbag]
    if bags[0] == "no other bag":
        return 0
    amount = 0
    for bag in bags:
        bag = bag.split(" ", 1)
        num = int(bag[0])
        inner = containsHowMany(bag[1])
        amount += num + num*inner

    return amount
# no other bags
# 106
# 132
# 131 correct
count = 0
for b in rules:
    #print(b)
    #print(rules[b])
    if contains("shiny gold bag", b) and b != "shiny gold bag":
        count += 1

print("ans 1")
print(count)
# 6148
# 8267
print("ans 2")
print(containsHowMany("shiny gold bag"))