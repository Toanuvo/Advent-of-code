file = open("inputd12.txt")
#file = open("test.txt")
lines = file.readlines()
INPUT = []
for i, line in enumerate(lines):
    line = line.strip("\n")
    a = line[0]
    b = line[1:]
    INPUT.append((a,b))

cur = 0
dirct = [0,0,0,0]
ds = {"N": 3, "S": 1, "E":0,"W":2}
waypoint = [0,0]
ds = {"N": (1,1), "S": (1,-1), "E":(0,1),"W":(0,-1)}
#cd= {0:"E", 1:"S",2:"W",3:"N"}
for d, n in INPUT:
   n = int(n)
   if d == "L":

       a = cur - n // 90
       print(a)
       cur = a % 4
   elif d == "R":
       a = cur + n // 90
       cur = a % 4
   elif d == "F":
       dirct[cur] += n
       #dirct[ds[cd[cur]][0]] += n*ds[cd[cur]][1]

   else:
       dirct[ds[d]] += n
       #dirct[ds[d][0]] += n*ds[d][1]

print(dirct)
print(abs(dirct[0]-dirct[2])+abs(dirct[1]-dirct[3]))
# 3451
# 3833
# 3767
# 1499

# correct 1565