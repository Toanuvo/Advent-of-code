from sympy.ntheory.modular import crt

file = open("inputd13.txt")
#file = open("test.txt")
lines = file.readlines()

targ = int(lines[0].strip("\n"))
times = lines[1].strip("\n").split(",")
for i,t in enumerate(times):
    if t != 'x':
        t = int(t)


newt = ""
mods = []
vals = []
ts = "19,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,523,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,17,13,x,x,x,x,x,x,x,x,x,x,29,x,853,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23"
for i,v in enumerate(ts.split(",")):
    if v == 'x':
        newt += '0'
    else:
        vals.append(int(v))
        mods.append(int(v) - i)

print(targ)
print(newt)
# times = [67,7,59,61]


print(mods)
print(vals)

print(crt(vals, mods))



# 52
# 259
"""for i in range(10):
    for t in times:
        if (targ + i) % t == 0:
            k = 0
            #print(t*i)
"""
# j = 7*1000000000000
n = 0
j = 0
while n == 0:
    # print(j)
    if j % times[0] != 0:
        j += 1
        continue
    for i,t in enumerate(times):
        if t == -1:
            continue
        if (j+i) % int(t) != 0:
            break
        elif t == times[len(times)-1]:
            n = j
            # print(n)
    j += times[0]
    # j += max(times)+times.index(max(times))

