number = 3701
power = len(str(number))
result = 0

for i in range(power):
    power_result = 1
    for y in range (power):
        power_result *= int(str(number)[i])
    result += power_result

if (result == number):
    print(f"{number} is an ArmsStrong number")
else:
    print(f"{number} is not an ArmsStrong number")
