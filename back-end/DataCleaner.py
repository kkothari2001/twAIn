import re
import enchant



def Clean(txt):
    #fin_txt = re.sub("\d"," " ,txt) #removes digits
    fin_txt=re.sub(' {2,}', ' ',txt) #removes multiple spaces
    fin_txt=fin_txt.lower() # converts to lowercase
    return fin_txt


def Grammarize(txt):
    fin_txt=""
    EngDict = enchant.Dict("en_US")    


    words=txt.split(" ")

    for word in words:

        if(EngDict.check(word)==False):    # if word doesnot exist in english dict

            suggestions=EngDict.suggest(word)

            if (len(suggestions)>0):
                for suggestion in suggestions:

                    if(EngDict.check(suggestion)==True): # if the suggession is Valid
                        fin_txt=fin_txt+" "+suggestion
                        break

        else:
            fin_txt=fin_txt+" "+word
    fin_txt=fin_txt.lstrip()        
    return fin_txt        




