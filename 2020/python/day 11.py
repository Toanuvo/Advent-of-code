from collections import Counter
file = open("inputd11.txt")
lines = file.readlines()

for i,line in enumerate(lines):
    lines[i] = list(line.strip("\n"))



print(len(lines))
coll = len(lines)
rowl = len(lines[0])
out = 1
last = 0
ran = 0
board = [[x for x in y] for y in lines]
while out != last:
    lines = [[x for x in y] for y in board]
    ran += 1
    #print(ran)
    last = out
    out = 0
    for i in range(coll):
        for j in range(rowl):
            if ran == 2 and i == 0 and j == 2:
                k =0
            cell = lines[i][j]
            if cell == '.':
                continue
            surrounded = []
            ti = i
            tj = j
            # up L
            while ti > 0 and tj > 0:
                ti -= 1
                tj -= 1
                seen = lines[ti][tj]
                if  seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # up
            while ti > 0:
                ti -= 1
                seen = lines[ti][tj]
                if  seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # LEft
            while tj > 0:
                tj -= 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break

            ti = i
            tj = j
            # right
            while tj + 1 < rowl:
                tj += 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # up right
            while ti > 0 and tj + 1 < rowl:
                ti -= 1
                tj += 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # down R
            while ti + 1 < coll and tj + 1 < rowl:
                ti += 1
                tj += 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # down
            while ti + 1 < coll:
                ti += 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break
            ti = i
            tj = j
            # L down
            while ti + 1 < coll and tj > 0:
                ti += 1
                tj -= 1
                seen = lines[ti][tj]
                if seen == '.':
                    continue
                else:
                    surrounded.append(seen)
                    break

            if cell == 'L' and '#' not in surrounded:
               board[i][j] = '#'
            cn = 0
            cn = Counter(surrounded)
            if cell == '#' and cn['#'] >= 5:
                board[i][j] = 'L'
    for line in board:
        cn = Counter(line)
        out += cn['#']
# 1934
# 2178
"""            if j != 0:
                surrounded.append(lines[i][j-1])
            if i != 0:
                surrounded.append((lines[i-1][j]))
            if i != 0 and j != 0:
                surrounded.append((lines[i - 1][j-1]))
            if i+1 < coll:
                surrounded.append(lines[i + 1][j])
            if j+1 < rowl:
                surrounded.append(lines[i ][j+1])
            if i+1 < coll and j+1 < rowl:
                surrounded.append( lines[i + 1][j + 1])

            if i+1 < coll and j != 0:
                surrounded.append(lines[i + 1][j - 1])
            if i != 0 and j+1 < rowl:
                surrounded.append(lines[i - 1][j +1 ])
"""

# 2009
print(out)
print(ran)
