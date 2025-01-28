number = 10
starter = 0
result = 0

for i in range(10):
    if starter!=i:
        result+=starter+1
        starter+=1
    print(result)

print(result)