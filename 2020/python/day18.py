import string

file = open("inputd18.txt")
lines = file.readlines()

for i,line in enumerate(lines):
    line = line.strip(".\n")
    line = line.replace(" ", "")
    lines[i] = line


print(string.digits)

def evaluate(expression, subexp = False):
    print(expression)
    numstack = []
    operatorstack = []


    for i,exp in enumerate(expression):
        if '(' == exp:
            evaluate(expression[i:], True)




        # try:
        #     int(exp)
        #     numstack.append(exp)
        # except ValueError:
        #     if exp == ')':
        #         op = operatorstack.pop()
        #         while op != '(':
        #             n1 = numstack.pop()
        #             n2 = numstack.pop()
        #             numstack.append(str(eval(n2+op+n1)))
        #             op = operatorstack.pop()
        #
        #     else:
        #         operatorstack.append(exp)

    # while operatorstack:
    #     op = operatorstack.pop()
    #     n1 = numstack.pop()
    #     n2 = numstack.pop()
    #     numstack.append(str(eval(n2 + op + n1)))
    # return int(numstack[0])

print(evaluate(lines[0]))