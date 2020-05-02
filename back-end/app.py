from flask import Flask
from flask import url_for,render_template,request

app = Flask(__name__)

PORT=8000
data={                 # the API response
    "InputStory":"",
    "OutputStory":""
}

@app.route('/')
@app.route('/home')
def home():
    return render_template('index.html')  # we have to render kush ka site here

@app.route('/api',methods=['GET'])   # the Model API endpoint
def API():
    text = request.args["input"]
    data["InputStory"]=text
        # the text will be passed on to the model and the response will be sent back
    return text

 
@app.route('/command')   # the Command API endpoint
def Command():           
    return "Commands is here!"   

if __name__ == '__main__':
    app.run(host='127.0.0.1',port=PORT)