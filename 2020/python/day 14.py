import itertools as it
file = open("inputd14.txt")
#file = open("test.txt")
lines = file.readlines()

def applymask(msk, bts):
    bts.reverse()
    while len(bts) < len(msk):
        bts.append('0')
    print(msk)
    print(bts)
    bits = list(it.zip_longest(msk, bts, fillvalue='.'))
    out = []
    for bit in bits:
        bm = bit[0]
        bn = bit[1]
        if '.' in bit or 'b' in bit:
            break
        if bm == 'X':
           out.append(bn)
        else: out.append(bm)
    out.reverse()
    print(out)
    out = str(int(''.join(out), 2))
    print(out)
    return out



arr = []
sect = []
mask = " "
mem = {}
for i,line in enumerate(lines):

    line = line.strip("\n").split(" ")
    if line[0] != "mask":
        b = applymask(mask, list(bin(int(line[2])))[2:])
        exec(line[0]+line[1]+b)
    else:
        mask = list(line[2])
        mask.reverse()

# 20507941868
# 6386593869035 correct
for i in mem:
    print(mem[i])
print(sum(mem.values()))


