def input_number(number1, number2):
    return int(input("Enter a number: ")) * number1


result = input_number(10, 6)
print(result)
result = input_number(number2=10, number1=3)
print(result)


def fizzBuzz(fizzBuzzList):
    for item in fizzBuzzList:
        if item % 5 == 0 and item % 3 == 0:
            print("FizzBuzz")
        elif item % 3 == 0:
            print("Buzz")
        elif item % 5 == 0:
            print("Fizz")
        else:
            print(item)


myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
fizzBuzz(myList)
