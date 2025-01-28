word = ("racecar")
splitted = list(word)
matches = True

for i in range(len(word)):
    if word[i] == word[len(word) - 1 - i]:
        continue
    else:
        matches = False
        break
if matches:
    print("We got a palindrome")
else:
    print("The word is not a palindrome")
