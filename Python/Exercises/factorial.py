import math

number = 5
result = math.factorial(number)
print(result)

result2 = 1

for i in range(number+1):
    if i == 0:
        continue
    result2 *= i

if result == result2:
    print("The factorial is", result2)
