# **twAIn**

An AI that generates amazing stories!

#### Team Name : **GoogleKarnaHamseSikho**

![Screenshot alt text](https://drive.google.com/uc?export=view&id=1sR5qjHWHNf2pAYr_ZPLEqDBCwXmJVuNh)

## 👩‍💻 Team members

- **Ravi Maurya 🦉**
- **Kush Kothari 😎**
- **Shreyas Penkar 🦊**
- **Nikheel Indanoor 🦅**

## 👨‍🏫 Mentors

- **Mehdi Patel**
- **Anuj Raghani**
- **Owais Hetavkar**

## 📝 Description

twAIn is an Artificial Intelligence that can write amazing stories. twAIn is powered by LSTM and GPT-2 Models. It is trained on 20+ famous and compelling novels of various Genres. twAIn can be used as a Web App and a Mobile App.<br/>Give some starting words and twAIn will write an amazing story for you. Currently the genres supported are Adventure, Horror and Mystery. The user has the option to listen, as twAIn reads the story aloud for you. Also there are 45 sample stories preloaded so that you can see the performance of that model.

## 🔗 Links

- GitHub repo link: [Link to repository](https://github.com/kkothari2001/twAIn)
- Drive link (Demo Video): [Drive link here](https://drive.google.com/drive/folders/157-9lOdn5lImO3KYgIIfoL04XEfkUpTj?usp=sharing)
- Model link: [Drive link here](https://drive.google.com/drive/folders/1aTae2Nz3ctIhPW-yzAo_pExutF03Ec-N?usp=sharing)

## 🤖 Technology Stack

- Front-end - HTML, CSS, Javascript
- Back-end - Python, [Flask](https://flask.palletsprojects.com/en/1.1.x/) (Flask is a lightweight WSGI web application framework.)
- Models - [LSTM](https://en.wikipedia.org/wiki/Long_short-term_memory), [Open AI's GPT-2](https://openai.com/blog/better-language-models/)
- Mobile App - [Flutter](https://flutter.dev/)

## 🛠️ Project Setup

#### For Web

1. Clone the repository

```
git clone https://github.com/kkothari2001/twAIn
```

2. Download the models from [here](https://drive.google.com/drive/folders/1aTae2Nz3ctIhPW-yzAo_pExutF03Ec-N?usp=sharing) (You can download single genre or all genres)
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

4. Open file MobileApp/twain*app/lib/utils/settings.dart.
   In this file set MODE to \*\*\_production*\*\*, and set IP_ADD to your local IP Address. (So that you can test it locally).
5. Install the app on your physical Mobile Device or Emulator.

## 🏃‍♀️ Usage

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

## ⚡ Applications

This project generates stories based on the input provided by the user. There are various genres for the user to select which includes _Adventure_ ,_Horror_,_Mystery_.
It can also convert the generated story into audio.

#### For Web

- Type "help" to get a help-page on your screen.
- Type "sample" to generate a sample story.
- Type "download" to download the generated story as a text file.

The stories to be generated take some time:-

- short story (250 chars) = max 2 mins
- medium story (550 chars) = max 4 mins
- long story (900 chars) = max 6 mins

If you dont wish to wait so much time you can type "sample" and press Enter or click Submit (Web)
to get a sample story of that genre and of a specific story length.
There are 45 sample stories preloaded and take about 3 seconds to load.

## 🔮 Future Scope

- [ ] We could add more genres
- [ ] Try to improve our LSTM model to maximize the results for story generation.
- [ ] We could also do a model for generating poems and other creative writing templates.
- [ ] We could also include a sentimental analysis model which will tell how good a story is (by a small survey we can know the sentiments of a user towards a particular story).

## 🖼 Screenshots

![Web App](https://drive.google.com/uc?export=view&id=1JNdp6u6c2waackYbFuUYu9wlTa3jJmhD)
![Mobile App](https://drive.google.com/uc?export=view&id=1mv1-QscqL9SuohiMJahynXNqne28llg9)
