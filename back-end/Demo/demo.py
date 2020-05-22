# DEMO - To check whether a word exists in english dictionary and also show suggestions
import enchant

word=input("INPUT >>> ")
word=word.lower()
EngDict = enchant.Dict("en_US")    
if(EngDict.check(word)==False):
    print("Suggestions >>>")
    print(EngDict.suggest(word))
else:
    print("The Word Exists!")    