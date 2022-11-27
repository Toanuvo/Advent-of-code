import numpy as np


code1 = 1965712
code2 = 19072108
#
# code1 = 5764801
# code2 = 17807724
subjectnum = 7


print(20201227%subjectnum)
keyloop = 0
# size = 10
# chks = np.ones([size], dtype=np.int64)
# # chks = np.array(list(zip(chks, np.arange(size))))
# print(chks)
# for i in range(size):
#     chks *= subjectnum
#     chks = chks%20201227
#     mask = ((chks == code1) | (chks == code2))
#     print(mask)
    # iskey =  np.where(, chks).nonzero()

v = 1
for loopsize in range(10000000):
    if v == code1:
        keyloop = loopsize
        print("card",loopsize)
    if v == code2:
        print("door",loopsize)

    v *= subjectnum
    v = v % 20201227
    # for i in range(loopsize):



# not 3550965
# correct 16881444
subjectnum = code2
v = 1
for i in range(keyloop):
    v *= subjectnum
    v = v % 20201227
print(v)