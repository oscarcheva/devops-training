string = "Original"
reversed_string = ""

for i in range(len(string)):
    reversed_string += string[len(string) - 1 - i]

print(string)
print(reversed_string)

cheating_reversed_string = list(string[::-1])
reversed_string_2 = ""

for i in range(len(cheating_reversed_string)):
    reversed_string_2 += cheating_reversed_string[i]

print(reversed_string_2)
