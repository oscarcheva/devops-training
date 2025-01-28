limit = 100

for i in range(limit):
    if i % 3 == 0:
        print(f"{i} is not a prime number")
    elif i % 5 == 0:
        print(f"{i} is not a prime number")
    elif i % 2 == 0:
        print(f"{i} is not a prime number")
    else:
        print(f"{i} is a prime number")
