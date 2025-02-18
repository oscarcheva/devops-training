import math

def armStrongNumber(number):
    power = len(str(number))
    result = 0

    for i in range(power):
        power_result = 1
        for y in range(power):
            power_result *= int(str(number)[i])
        result += power_result

    if result == number:
        print(f"{number} is an ArmsStrong number")
    else:
        print(f"{number} is not an ArmsStrong number")


def countVowels(word):
    counter = 0

    for i in range(len(word)):
        if word[i].lower() in "aeiou":
            print(f"{word[i]} is a vowel")
            counter += 1

    print("You have", counter, "vowels in your name")


def duplicatesChecker(myList):
    myList.sort()

    for i in range(len(myList) - 1):

        if myList[i] == myList[i + 1]:
            print(f"{myList[i]} is a duplicate!")


armStrongNumber(number=153)
countVowels("Echeverria")
duplicatesChecker(myList=[1, 3, 4, 6, 2, 6, 4, 8])
