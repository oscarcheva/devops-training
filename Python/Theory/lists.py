countries = ["Argentina", "Brazil", "Uruguay"]
print(len(countries))
del countries[1]
print(len(countries))

countries.append("Paraguay")  # Appends at the end
print(countries)

countries.insert(2, "Peru")  # Appends at the end
print(countries)

countries[0], countries[1] = countries[1], countries[0]
print(countries)

numbers = [4, 9, 7, 0, 1]
numbers.sort()
print(numbers)
numbers.reverse()
print(numbers)

total = 0
for number in numbers:
    total += number
    print(total)

half_countries = countries[0:2]
print(half_countries)

print(countries)

if "Uruguay" in countries:
    print("Uruguay no ma'")
else:
    print("Almost")

lot_of_countries = [
    ["Argentina", "Brazil", "Uruguay"],
    ["Venezuela", "Colombia", "Ecuador"],
    ["Peru", "Paraguay", "Bolivia"]
]
print(lot_of_countries[1][2])
