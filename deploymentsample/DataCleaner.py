import re
import enchant



def Clean(txt):
    txt = txt.replace('\n', ' ') # next line to space

    s_result = []   # deals with special characters and numbers and lowers the alphas
    for i in txt:
        if i.isalpha() or i == ' ':
            s_result.append(i.lower())
    txt=''.join(s_result)
    txt = re.sub(' +', ' ', txt)
    txt=re.sub(' {2,}', ' ',txt) #removes multiple spaces
    return txt


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



