"""import numpy as np
from flask import Flask, request,justify,render_template
import pickle
app = Flask(__name__)
model = pickle.load(open("samplemodel.pkl","rb"))
@app.route("/")
def home():
    return render_template("index.html")
@app.route("/generate",methods = ["post"])
def generate():
    input_text = np.array([x for x in request.form.values()])
    storyy = model.generate(input_text)
    return render_template("index.html",story = storyy)
if __name__=="__main__":
    app.run(debug=True)"""

from flask import Flask
from flask import url_for,render_template,request
#from DataCleaner import Clean,Grammarize
#from DataCleaner import Clean,Grammarize
#from ModelDriver import generate

app = Flask(__name__)

PORT=8000               # the API response
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

def API(genre):  # API handler function
    """data["Genre"]=genre
    text = request.args["inputText"]
    text=(text.lstrip()).rstrip()
    # data["InputStory"]=Grammarize(Clean(text))   """         # calling Data cleaning module
    data["InputStory"]=text             # only for gpt-2 model 
    # data["OutputStory"]=generate(data["InputStory"],genre)  # the text will be passed on to the model and the response will be sent back  
    data["OutputStory"]=text*50  # just for demo 
    data["WordsCount"]=len(data["OutputStory"].split())
    data["TokenCount"]=len(data["OutputStory"])

# Routes
@app.route('/')
@app.route('/home')
def home():
    return render_template('index.html')  # we have to render kush ka site here

@app.route('/api',methods=['GET'])   # the Model API endpoint
def API():
    text1 = request.args["input"]
    text2 = request.args["inputText"]
    #text=(text.lstrip()).rstrip()
    #data["InputStory"]=text # calling Data cleaning module
    return (text1+" "+text2+" ")*50 # the text will be passed on to the model and the response will be sent back

@app.route('/api/adventure',methods=['GET'])   # the Model API adventure endpoint
def adventure():
   API("adventure")
   return data



@app.route('/api/horror',methods=['GET'])   # the Model API horror endpoint
def horror():
    API("horror")
    return data



@app.route('/api/action',methods=['GET'])   # the Model API action endpoint
def action():
    API("action")
    return data
if __name__ == "__main__":
    app.run(debug=True)