from flask import Flask
from flask import url_for,render_template,request
from flask_cors import CORS
#from DataCleaner import Clean,Grammarize
#from ModelDriver import generate

app = Flask(__name__)
CORS(app)

PORT=8000
TokenCount={  # Story Length (can be implemented later)
    "Short":1023,
    "Medium":1705,
    "Long":2728
}

data={           # the API response
    "Genre":"",
    "LengthType":"short", # short/medium/long
    "TokenCount":0,
    "WordsCount":0,
    "InputStory":"",
    "OutputStory":""
}

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

def API(genre):  # API handler function
    data["Genre"]=genre
    text = request.args["inputText"]
    text=(text.lstrip()).rstrip()
    # data["InputStory"]=Grammarize(Clean(text))            # calling Data cleaning module
    data["InputStory"]=text             # only for gpt-2 model 
    # data["OutputStory"]=generate(data["InputStory"],genre)  # the text will be passed on to the model and the response will be sent back  

    if (text!="sample"):
        data["OutputStory"]=text*50  # just for demo 
    else:
        data["OutputStory"]=SampleStoryReader(genre) 

    data["WordsCount"]=len(data["OutputStory"].split())
    data["TokenCount"]=len(data["OutputStory"])

# Routes
@app.route('/')
@app.route('/home')
def home():
    return render_template('index.html')  # we have to render kush ka site here

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

# @app.route('/api/adventure/sample',methods=['GET'])   # the Model API adventure endpoint
# def adventure():
#    API("adventure","sample")
#    return data

# @app.route('/api/horror/sample',methods=['GET'])   # the Model API horror endpoint
# def horror():
#     API("horror","sample")
#     return data

# @app.route('/api/mystery/sample',methods=['GET'])   # the Model API action endpoint
# def action():
#     API("mystery","sample")
#     return data

@app.route('/privacy-policy')
def policy():
    return render_template('privacy_policy.html')
 
@app.route('/command')   # the Command API endpoint
def Command():           
    return "Commands is here!"   

if __name__ == '__main__':
    app.run(host='127.0.0.1',port=PORT)