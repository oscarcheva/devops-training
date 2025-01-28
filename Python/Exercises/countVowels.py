word = "Echeverria"
counter = 0

for i in range(len(word)):
    if word[i].lower() in "aeiou":
        print(f"{word[i]} is a vowel")
        counter += 1

print("You have", counter, "vowels in your name")
