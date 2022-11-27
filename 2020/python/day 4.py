file = open("inputd4.txt")
lines = file.readlines()


ids = []
d = {}
for line in lines:
    if line == "\n":
        ids.append(d.copy())
        d = {}
        continue
    line = line.strip("\n")
    line = line.split(" ")
    for i in line:
        i = i.split(":")
        d[i[0]] = i[1]

count = 0
for id in ids:
    if 'byr' in id:
        b = int(id['byr'])
        if not 1920 <= b <= 2002:
            continue
        if 'iyr' in id:
            b = int(id['iyr'])
            if not 2010 <= b <= 2020:
                continue
            if 'eyr' in id:
                b = int(id['eyr'])
                if not 2020 <= b <= 2030:
                    continue
                if 'hgt' in id:
                    b = id['hgt']
                    if not ("cm" in b or "in" in b):
                        continue
                    elif "cm" in b:
                        if not 150 <= int(b.strip("cm")) <= 193:
                            continue
                    elif "in" in b:
                        if not 59 <= int(b.strip("in")) <= 76:
                            continue
                    if 'hcl' in id:
                        b = id['hcl']
                        if not b[0] == "#":
                            continue
                        elif not len(b) == 7:
                            continue
                        if 'pid' in id:
                            b = id['pid']
                            if not len(b) == 9:
                                continue
                            if 'ecl' in id:
                                b = id['ecl']
                                if not (b == "amb" or b == "blu" or b == "brn" or b == "gry" or b == "grn" or b == "hzl" or b == "oth"):
                                    print(b)
                                    continue
                                count += 1




print(count)

# 251
# 237
# 228 correct
# 227

# 175 correct
# 14