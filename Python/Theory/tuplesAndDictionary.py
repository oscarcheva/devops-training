# Defined with parenthesis, the Tuple is immutable
myTuple = (1, 2, 3)

# Dictionary, defined with curly braces
myDictionary = {
    "key1": "value1",
    "key2": "value2"
}
print(myDictionary.keys())
print(myDictionary.values())
print(myDictionary.items())

for key in myDictionary.keys():
    print(key + " - " + myDictionary[key])

myDictionary["key1"] = "updateValue"
myDictionary.update({"key3": "value3"})
del myDictionary["key2"]
print(myDictionary.items())

