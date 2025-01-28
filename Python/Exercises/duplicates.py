myList = [1, 3, 4, 6, 2, 6, 4, 8]
myList.sort()

for i in range(len(myList)-1):

    if myList[i] == myList[i+1]:
        print(f"{myList[i]} is a duplicate!")