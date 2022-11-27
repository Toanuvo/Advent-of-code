file = open("inputd6.txt")
lines = file.readlines()

answers = []
d = []
for line in lines:
    if line == "\n":
        answers.append(d)
        d = []
        continue
    line = line.strip("\n")
    d.append(line)
count = 0
for a in answers:
    other = a[0:]
    for c in a[0]:
        for s in other:
            if c not in s:
                break
        else: count += 1


print(count)
# 3382
# 6662

