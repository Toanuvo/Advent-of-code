import itertools
file = open("inputd9.txt")
lines = file.readlines()


for i,line in enumerate(lines):
    lines[i] = int(line.strip("\n"))


ran = 0
def canSum(target, nums, memo=None):
    global ran
    ran += 1
    if memo is None:
        memo = {}
    if target in memo:
        return memo[target]
    if target < 0:
        return False
    if target == 0:
        return True

    for num in nums:
        if canSum(target - num, nums, memo):
            memo[target] = True
            return True

    memo[target] = False
    return False


def summedarr(n, array):
    global ran
    for a, b in itertools.combinations(array, 2):
        ran += 1
        if a + b == n:
            return True

    return False


# 10884537
index = 25
preamble = lines[:index-1]
while index < len(lines):
    targ = int(lines[index])
    if not summedarr(targ, preamble):
        print(targ==10884537)
        break

    index += 1
    preamble = lines[index-25:index]

for i in range(500):
    for j in range(500):
        arr = lines[i:j]
        if sum(arr) == 10884537:
            print(min(arr))
            print(max(arr))
            print(min(arr)+max(arr))


print(ran)