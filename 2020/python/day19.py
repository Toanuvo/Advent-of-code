import string
import itertools as iter

file = open("inputd19.txt")
lines = file.readlines()

rules = []
msgs = []
for i,line in enumerate(lines):
    line = line.strip(".\n")
    if not line:
        continue
    if ':' in line:
        line = line.split(':')
        line[1] = line[1].strip(' ')
        rules.append(line)
        continue
    msgs.append(line)

rules.sort(key=lambda x: int(x[0]))
print(rules)

e1 = ['12', '13']
e2 = ['21', '23']
p = [e1+e2 for e1,e2 in iter.product(e1,e2)]
print(p)


def validexp(rule):
    # print("rule = ", rule)
    if rule == "\"b\"" or rule == "\"a\"":
        return rule.strip('\"')
    if '|' in rule:
        rule = rule.split('|')
        exp1 = validexp(rule[0].strip(' '))
        exp2 =  validexp(rule[1].strip(' '))
        out = []
        try:
            out = out + exp1
        except TypeError:
            out.append(exp1)
        try:
            out = out + exp2
        except TypeError:
            out.append(exp2)
                # print('dub',out)
        return out


    elif ' ' in rule:
        rule = rule.split(' ')
        exp1 = validexp(rules[int(rule[0])][1])

        exp2 = validexp(rules[int(rule[1])][1])

        if type(exp1) == type(exp2):
            if type(exp1) == str:
                return exp1 + exp2
            else:
                return [e1+e2 for e1,e2 in iter.product(exp1,exp2)]
        else:
            if type(exp1) == list:
                out = [e+exp2 for e in exp1]
            else:
                out = [exp1+e for e in exp2]
            # le[0].append(le[1])
            # print('norm', out)
            return out
            

    else:
        out = validexp(rules[int(rule)][1])
        # print('1rul',out)
        return out
valids = validexp(rules[0][1])
valid = 0
for msg in msgs:
    if msg in valids:
        valid += 1
print(msgs[0])
print(valids[0])
print(valid)
#correct 203