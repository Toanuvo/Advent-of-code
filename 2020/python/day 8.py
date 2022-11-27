file = open("inputd8.txt")
lines = file.readlines()

for i,line in enumerate(lines):
    line = line.strip(".\n")
    line = line.split(" ")
    lines[i] = line




def checkHalt():
    index = 0
    accumulator = 0
    ran = []
    while index not in ran:
        if index == len(lines):
            print(accumulator)
            break
        line = lines[index]
        ins = line[0]
        num = int(line[1])

        if ins == "acc":
            accumulator += num
            ran.append(index)
            index += 1
            continue
        elif ins == "nop":
            ran.append(index)
            index += 1
            continue
        elif ins == "jmp":
            ran.append(index)
            index += num
            continue


for i,v in enumerate(lines):
    if v[0] == "nop":
        lines[i][0] = "jmp"
        checkHalt()
        lines[i][0] = "nop"
    if v[0] == "jmp":
        lines[i][0] = "nop"
        checkHalt()
        lines[i][0] = "jmp"




# 2765
# 2025 correct

