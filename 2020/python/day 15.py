import itertools as it
file = open("inputd15.txt")
#file = open("test.txt")
lines = file.readlines()
inarr = [6,19,0,5,7,13,1]

inp = it.cycle(lines[0].strip("\n").split(","))
inp = it.cycle(inarr)
numSpace = {}
first = True
for i,v in enumerate(inarr):
    numSpace[v] = [(i+1),0]
numsAmm = {}


print(numSpace)
starts = len(inarr)
last = inarr[-1]
ith = 30000000
for turn in range(len(inarr)+1, ith+10):
    # print(last)
    if turn % 1000000 == 0:
        print(turn)

    if first:
        first = False
        spoken = 0
    else:
        spoken = numSpace[last][0] - numSpace[last][1]

    if spoken not in numSpace:
        first = True
        numSpace[spoken] = [turn,0]
        # print(max(numSpace.keys()))
    else:
        numSpace[spoken][1] = numSpace[spoken][0]
        numSpace[spoken][0] = turn


    if turn == ith:
        print(spoken)
        break

    last = spoken

# correct 1801753