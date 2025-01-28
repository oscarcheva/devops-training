number = 134
result = 0

for i in range(len(list(str(number)))):
    result += int(str(number)[i])

print(result)