file = open("inputd2.txt")
lines = file.readlines()

count = 0
for line in lines:

    line = line.strip("\n").replace("-", " ").replace(":", "").split(" ")
    mini = int(line[0])-1
    maxi = int(line[1])-1

    c = line[2]
    s = line[3]

    if (s[mini] == c) ^ (s[maxi] == c):
        count += 1

print(count)
