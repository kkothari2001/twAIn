# **twAIn_**

An AI that generates amazing stories!

### Team Name : **GoogleKarnaHamseSikho**
![Screenshot alt text](./images/headerbg.png)

## Team members
- **Ravi Maurya 🦉** - ravimaurya027@gmail.com
- **Kush Kothari 😎** - kushkothari2001@gmail.com
- **Shreyas Penkar 🦊** - shreyaspenkar123@gmail.com
- **Nikheel Indanoor 🦅** - nikheelindanoor123@gmail.com

## Mentors
- **Mehdi Patel**
- **Anuj Raghani**
- **Owais Hetavkar**

## Description
twAIn is an Artificial Intelligence that can write amazing stories. twAIn is powered by LSTM and GPT-2 Models. It is trained on 20+ novels of different Genres. twAIn can be used as a Web App and a Mobile App.<br/>Give some starting words and twAIn will write a story for you. Currently the genres supported are Adventure, Horror and Mystery. The user can also listen to the generated story as twAIn reads aloud the story for you.

## Links
* GitHub repo link: [Link to repository](https://github.com/kkothari2001/twAIn)
* Drive link: [Drive link here](https://drive.google.com/)

## Technology Stack
* Front-end - HTML, CSS, Javascript
* Back-end - Python, [Flask](https://flask.palletsprojects.com/en/1.1.x/) (Flask is a lightweight WSGI web application framework.)
* Models - [LSTM](https://en.wikipedia.org/wiki/Long_short-term_memory),  [Open AI's GPT-2](https://openai.com/blog/better-language-models/)
* Mobile App - [Flutter](https://flutter.dev/)

## Project Setup
#### For Web
1. Clone the repository
```
git clone https://github.com/kkothari2001/twAIn
```
2. Download the models from [here](https://drive.google.com/) (You can download single genre or all genres)
3. After downloading the models, add the models in this path
```
twAIn/WebApp/checkpoint/<genreNameFolders>

Eg. twAIn/WebApp/checkpoint/adventure
                           /horror
                           /mystery
```
4. Now, Install all the python packages from WebApp/requirements.txt in a Virtual Environment.

#### For Mobile
1. Follow All the Instructions of Web First.
2. Make sure you have Flutter installed on your PC.
3. Go to MobileApp/twain_app and run flutter pub get to install all dependencies.
```
flutter pub get
```
4. Open file MobileApp/twain_app/lib/utils/settings.dart. 
    In this file set MODE to ***production***, and set IP_ADD to your local IP Address. (So that you can test it locally).
5. Install the app on your physical Mobile Device or Emulator.

## Usage
After setting up for Web and Mobile follow the below instructions to get it running.
#### For Web
1. Goto twAIn/WebApp & Execute this to run the Web App
```
python app.py
```
2. Open [localhost:8000/](localhost:8000/) in your browser to use twAIn.

#### For Mobile
1. Goto twAIn/WebApp & Execute this and keep it running in the background.
```
python app.py
```
2. Make sure your PC and Mobile is connected on same Wifi Network. (Or your PC is connected to your Mobile's Hotstop) & You can followed the Project Setup for Mobile App above.
3. Open the app in your Mobile Phone to use twAIn.

## Applications
This project generates stories based on the input provided by the user. There are various genres for the user to select which includes *Adventure* ,*Horror*,*Mystery*.
It can also convert the generated story into audio.

## Future Scope


## Screeshots
    __screenshots of input and output__
