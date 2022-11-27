file = open("inputd3.txt")
lines = file.readlines()


for line in lines:
    line = line.strip("\n")
h = 1 # 323 11
w = 3 # 32 11

def check(H,W):
    h = H
    w = W
    count = 0
    while h < 323:
        if lines[h][w] == '#':
            count += 1

        h += H
        w += W
        if w >= 31:
            w -= 31
    return count


print(check(1,1)*check(1,3)*check(1,5)*check(1,7)*check(2,1))

# 234