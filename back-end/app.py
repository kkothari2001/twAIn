from flask import Flask
from flask import url_for,render_template,request
#from DataCleaner import Clean,Grammarize
#from ModelDriver import generate

app = Flask(__name__)

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

def API(genre):  # API handler function
    data["Genre"]=genre
    text = request.args["inputText"]
    text=(text.lstrip()).rstrip()
    # data["InputStory"]=Grammarize(Clean(text))            # calling Data cleaning module
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

@app.route('/privacy-policy')
def policy():
    return render_template('privacy_policy.html')
 
@app.route('/command')   # the Command API endpoint
def Command():           
    return "Commands is here!"   

if __name__ == '__main__':
    app.run(host='127.0.0.1',port=PORT)