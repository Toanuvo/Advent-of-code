file = open("inputd10.txt")
lines = file.readlines()

for i,line in enumerate(lines):
    lines[i] = int(line.strip(".\n"))

j1 = 0
j3 = 0
cur = 0

while cur <= max(lines):
    if cur + 1 in lines:
        cur += 1
        j1 += 1
    else:
        cur += 3
        j3 += 1

print(j1*j3)
# 2775
ran = 0

def comb(current, lines, memo=None):
    global ran
    ran += 1
    if memo is None:
        memo = {}
    if current in memo:
        return memo[current]
    if current >= max(lines):
        return 1
    sum = 0
    flag = True
    if current + 1 in lines:
        flag = False
        sum += comb(current+1,lines, memo)
    if current + 2 in lines:
        flag = False
        sum += comb(current+2, lines, memo)
    if current + 3 in lines:
        flag = False
        sum += comb(current+3, lines, memo)

    if flag:
        return 0
    memo[current] = sum
    return memo[current]

print(comb(0,lines))
print(ran)