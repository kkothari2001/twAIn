from flask import Flask
from flask import url_for,render_template,request
from flask_cors import CORS
#from DataCleaner import Clean,Grammarize
from ModelDriver import generate

app = Flask(__name__)
CORS(app)

PORT=8000
TokenCount={  # Story Length (can be implemented later)
    "short":250,
    "medium":550,
    "long":900
}

data={           # the API response
    "Genre":"",
    "LengthType":"short", # short/medium/long
    "TokenCount":0,
    "WordsCount":0,
    "InputStory":"",
    "OutputStory":""
}

reps={
"adventure":
{
	"short":1,
	"medium":1,
	"long":1,
},
"mystery":
{
	"short":1,
	"medium":1,
	"long":1,
},
"horror":
{
	"short":1,
	"medium":1,
	"long":1,
}
}

def SampleStoryReader(genre,length):

    # storynum=reps[genre][length]
    if((reps[genre][length])==6):
        reps[genre][length]=1

    url="Genstories/"+genre+"/"+length+"/"+str(reps[genre][length])+".txt" # GenStories\adventure\long\(1-5).txt
    reps[genre][length]=reps[genre][length]+1
    f = open(file=url,mode="r",encoding="utf8")

    StoryList=(f.readlines())
    Story=""

    for i in range(0,len(StoryList)):
        Story=Story+StoryList[i]+"\n"

    f.close()
    return Story

def API(genre):  # API handler function
    data["Genre"]=genre
    text = request.args["inputText"]

    length=request.args["length"]
    data["LengthType"]=length

    text=(text.lstrip()).rstrip()
    # data["InputStory"]=Grammarize(Clean(text))          
    data["InputStory"]=text             # only for gpt-2 model 

    if ((text.lower())!="sample"):
        data["OutputStory"]=generate(data["InputStory"],genre,TokenCount[length])   
    else:
        data["OutputStory"]=SampleStoryReader(genre,length) 

    data["WordsCount"]=len(data["OutputStory"].split())
    data["TokenCount"]=len(data["OutputStory"])

# Routes
@app.route('/')
@app.route('/home')
def home():
    return render_template('index.html')  # we have to render site here

@app.route('/api/adventure',methods=['GET'])   # the Model API adventure endpoint
def adventure():
   API("adventure")
   return data

@app.route('/api/horror',methods=['GET'])   # the Model API horror endpoint
def horror():
    API("horror")
    return data

@app.route('/api/mystery',methods=['GET'])   # the Model API action endpoint
def action():
    API("mystery")
    return data

if __name__ == '__main__':
    app.run(host='127.0.0.1',port=PORT)