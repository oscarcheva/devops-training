
# While Loop
secret_number = 3
guess = int(input("Guess a number: "))
while guess != secret_number:
    guess = int(input("Nope, again guess a number: "))
else:
    print("You got it! The secret number was:", secret_number)

