from math import *
file = open("inputd5.txt")
lines = file.readlines()




def binarySearch(arr, l, r, x):
    # Check base case
    if r >= l:

        mid = l + (r - l) // 2

        # If element is present at the middle itself
        if len(arr) == x:
            return mid

            # If element is smaller than mid, then it
        # can only be present in left subarray
        elif arr[x] == "L" or arr[x] == "F":
            return binarySearch(arr, l, mid, x+1)

            # Else the element can only be present
        # in right subarray
        else:
            return binarySearch(arr, mid + 1, r, x+1)

    else:
        # Element is not present in the array
        return -1

seats = [[0]*8 for x in range(128)]
for line in lines:
    line = line.strip("\n")
    row = binarySearch(line[:7], 0, 127, 0)
    col = binarySearch(line[7:], 0, 7, 0)
    seats[row][col] = 8 * row + col



# 959
# 952
# 944 correct

for i in seats:
    print(i)