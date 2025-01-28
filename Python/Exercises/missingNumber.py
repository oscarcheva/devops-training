number = 12359
missing = 0

for i in range(len(list(str(number))) - 1):
    if int(str(number)[i + 1]) - int(str(number)[i]) == 1:
        continue
    missing = int(str(number)[i]) + (int(str(number)[i + 1]) - 1 - int(str(number)[i]))

print(missing)
