let theme = "green";
let genre = "adventure";
let length = "medium";
var i = 0;
let tts;
let isSpeaking = false;
let stopLoading = false;
var Edisabled=false;

var timer = {
  // 1/(n+3) n=no of seconds

  adventure: {
    short: 0.0096, // time update required
    medium: 0.005, //
    long: 0.0035, //
  },
  mystery: {
    short: 0.0125, //
    medium: 0.0071, //
    long: 0.004, //
  },
  horror: {
    short: 0.0137, // update required
    medium: 0.0071, //
    long: 0.00396, //
  },
};

function adventure() {
  if (genre !== "adventure") {
    let adventureb = document.getElementById("adventure");
    let horrorb = document.getElementById("horror");
    let mysteryb = document.getElementById("mystery");
    adventureb.classList.add("active");
    if (horrorb.classList.contains("active")) {
      horrorb.classList.remove("active");
    }

    if (mysteryb.classList.contains("active")) {
      mysteryb.classList.remove("active");
    }
    genre = "adventure";
    console.log(genre);
  }
}

function horror() {
  if (genre !== "horror") {
    let adventureb = document.getElementById("adventure");
    let horrorb = document.getElementById("horror");
    let mysteryb = document.getElementById("mystery");
    horrorb.classList.add("active");
    if (adventureb.classList.contains("active")) {
      adventureb.classList.remove("active");
    }

    if (mysteryb.classList.contains("active")) {
      mysteryb.classList.remove("active");
    }
    genre = "horror";
    console.log(genre);
  }
}

function mystery() {
  if (genre !== "mystery") {
    let adventureb = document.getElementById("adventure");
    let horrorb = document.getElementById("horror");
    let mysteryb = document.getElementById("mystery");
    mysteryb.classList.add("active");
    if (horrorb.classList.contains("active")) {
      horrorb.classList.remove("active");
    }

    if (adventureb.classList.contains("active")) {
      adventureb.classList.remove("active");
    }
    genre = "mystery";
    console.log(genre);
  }
}

function greenClick() {
  if (theme === "blue") {
    let root = document.documentElement;
    let greenb = document.getElementById("green");
    let blueb = document.getElementById("blue");
    greenb.classList.add("active");
    blueb.classList.remove("active");
    root.style.setProperty("--main-opp-color", "#69ff56");
    theme = "green";
    console.log(theme);
  }
}

function blueClick() {
  if (theme === "green") {
    let root = document.documentElement;
    let greenb = document.getElementById("green");
    let blueb = document.getElementById("blue");
    blueb.classList.add("active");
    greenb.classList.remove("active");
    root.style.setProperty("--main-opp-color", "#00fffc");
    theme = "blue";
    console.log(theme);
  }
}

function short() {
  if (length !== "short") {
    let shortb = document.getElementById("short");
    let mediumb = document.getElementById("medium");
    let longb = document.getElementById("long");
    shortb.classList.add("active");
    if (longb.classList.contains("active")) {
      longb.classList.remove("active");
    }
    if (mediumb.classList.contains("active")) {
      mediumb.classList.remove("active");
    }
    length = "short";
    console.log(length);
  }
}

function medium() {
  if (length !== "medium") {
    let shortb = document.getElementById("short");
    let mediumb = document.getElementById("medium");
    let longb = document.getElementById("long");
    mediumb.classList.add("active");
    if (longb.classList.contains("active")) {
      longb.classList.remove("active");
    }
    if (shortb.classList.contains("active")) {
      shortb.classList.remove("active");
    }
    length = "medium";
    console.log(length);
  }
}

function long() {
  if (length !== "long") {
    let shortb = document.getElementById("short");
    let mediumb = document.getElementById("medium");
    let longb = document.getElementById("long");
    longb.classList.add("active");
    if (shortb.classList.contains("active")) {
      shortb.classList.remove("active");
    }
    if (mediumb.classList.contains("active")) {
      mediumb.classList.remove("active");
    }
    length = "long";
    console.log(length);
  }
}


document.querySelector('#story-input input').addEventListener('keyup', function(event) {
	if (event.code === 'Enter'&& Edisabled==false) {
		event.preventDefault();
    document.getElementById("submit").click();
    
	}
});

document.getElementById("submit").addEventListener("click", function () {
  var url = "http://127.0.0.1:8000/api/" + genre;
  document.getElementById("submit").disabled = true;
  Edisabled=true;
  stopLoading=false;
  console.log(document.getElementById("submit").disabled)

  if (document.getElementById("text-input").value == "") {
    document.getElementById("story-output").innerHTML = "PLEASE ENTER A PHRASE ABOVE TO GET STARTED!";
  } else if (document.getElementById("text-input").value == "download") {
    axios
      .get("http://127.0.0.1:8000/download")
      .then((response) => {
        download(response.data);
      })
      .catch(
        (error) => {
          document.getElementById("story-output").innerHTML = "OOPS! SOMETHING WENT WRONG :(";
          document.getElementById("submit").disabled = false;
          Edisabled=false;
        }
      );
  } else if ( document.getElementById("text-input").value.toLowerCase() == "help" ) {
    document.getElementById("story-output").innerHTML = '<ul id="ulll"><li>1) SELECT A GENRE</li><li> </li><li>2) PLEASE ENTER A PHRASE ABOVE AND CLICK SUBMIT</li><li>OR</li><li>ENTER "sample" ABOVE TO GET A SAMPLE RANDOM STORY</li><li></li><li>3) TYPE "help" TO SHOW THIS PAGE AGAIN</li><li></li><li>4) TYPE "download" TO STORE THE STORY ON YOUR PC</li></ul>';
  } else {
    document.getElementById("story-output").innerHTML = '<div class="mainload"><div class="loadingio-spinner-eclipse-2we2o8onnes" id="loading-icon"> <div class="ldio-6hi50wurrob"><div></div></div></div><div id="myProgress"><div id="myBar"></div><h4 id="pertag">0.0 %</h4></div></div>';
    console.log("Loading started!");
    loading();

    axios
      .get(url, {
        params: {
          inputText: document.getElementById("text-input").value,
          length: length,
        },
      })
      .then((response) => {
        
        if (document.getElementById("text-input").value.toLowerCase() == "sample" ) {
          setTimeout(function () {
            var data = response.data["OutputStory"];
            document.getElementById("story-output").innerHTML = "<pre>" + data + "</pre>";
            i = 0;
            stopLoading = true;
            document.getElementById("submit").disabled = false;
            Edisabled=false;
            console.log(document.getElementById("submit").disabled)
          }, 3000);
        } else {
          var data = response.data["OutputStory"];
          document.getElementById("story-output").innerHTML = "<pre>" + data + "</pre>";
          document.getElementById("submit").disabled = false;
          Edisabled=false;
        }
        

      })
      .catch(
        (error) => {
          document.getElementById("story-output").innerHTML = "OOPS! SOMETHING WENT WRONG :(";
          i = 0;
          document.getElementById("submit").disabled = false;
          stopLoading = true;
          Edisabled=false;
        }
      );
  }
  // stopLoading=false;

});

// Text to Speech
function speakStory() {
  let story = document.getElementById("story-output").innerText;

  if (story == "") {
    speakOnClick("Hello I'm Twain! I write awesome stories!");
  } else {
    speakOnClick(story);
  }
}

const speakOnClick = (textInput) => {
  tts = window.speechSynthesis;
  if (isSpeaking) {
    tts.cancel();
    isSpeaking = false;
  } else {
    const toSpeak = new SpeechSynthesisUtterance(textInput);
    const voiceName = window.speechSynthesis.getVoices()[0];
    toSpeak.voice = voiceName;
    tts.speak(toSpeak);
    isSpeaking = true;
  }
};

function loading() {
  let time;
  if (document.getElementById("text-input").value.toLowerCase() == "sample"){
    console.log("sample loader");
    time = 0.3383;
  }
  else time = timer[genre][length];

  // spinner
  let load = document.getElementById("loading-icon");
  if (document.getElementById("loading-icon") != null) {
    load.style.display = "initial";
    document.getElementById("pertag").innerText = "0.0 %";
  }
  
  // progress bar
  if (i == 0) {
    i = 1;
    var width = 1;
    var id = setInterval(frame, 10);

    function frame() {
      if (width >= 100 || stopLoading) {
        clearInterval(id);
        i = 0;
        stopLoading = false;
      } else {
        width = width + time;
        // console.log(time);
        if (document.getElementById("pertag") != null) {
          document.getElementById("pertag").innerText = width.toFixed(1) + " %";
          document.getElementById("myBar").style.width =
            Math.round(width).toString() + "%";
        }
      }
    }
  }
}

function download(text) {
  var element = document.createElement("a");
  element.setAttribute(
    "href",
    "data:text/plain;charset=utf-8," + encodeURIComponent(text)
  );
  filename = genre + "-" + length + "-story.txt";
  element.setAttribute("download", filename);

  element.style.display = "none";
  document.body.appendChild(element);

  element.click();

  document.body.removeChild(element);
}

window.addEventListener("beforeunload", function (event) {
  tts.cancel();
});
