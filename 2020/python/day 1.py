file = open("d1input.txt")
lines = file.readlines();
data = map(int, open('d1input.txt').readlines())
print(data)
input = []

for line in lines:
    input.append(int(line.strip("\n")))



def sum2():
    for i in input:
        for j in input:
            if i != j and i + j == 2020:
                print(i)
                print(j)
                return i * j

def sum3():
    for i in input:
        for j in input:
            for k in input:
                if i != j != k and i + j + k == 2020:
                    print(i)
                    print(j)
                    print(k)
                    return i * j * k

print(sum2())
print(sum3())