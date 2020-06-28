def SampleStoryReader(genre):
    url="Genstories/"+genre+".txt"
    f = open(file=url,mode="r",encoding="utf8")
    StoryList=(f.readlines())
    Story=""
    for i in range(0,len(StoryList)):
        Story=Story+StoryList[i]+"\n"

    f.close()
    # print(StoryList)
    return Story

print(SampleStoryReader("adventure"))