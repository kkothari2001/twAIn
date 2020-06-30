let theme = "green";
let genre = "adventure";
let length = "medium";
var i=0;

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




var submit=document.getElementById("submit");
var url='http://127.0.0.1:8000/api/'+genre;
 
submit.addEventListener("click",function(){

	document.getElementById("story-output").innerHTML="<div class=\"mainload\"><div class=\"loadingio-spinner-eclipse-2we2o8onnes\" id=\"loading-icon\"> <div class=\"ldio-6hi50wurrob\"><div></div></div></div><div id=\"myProgress\"><div id=\"myBar\"></div><h4 id=\"pertag\">0.0 %</h4></div></div>"
	setTimeout(function () {
	loading();
	}, 1000);

	if (document.getElementById("text-input").value=="")
	{
		document.getElementById("story-output").innerHTML="PLEASE ENTER A PHRASE ABOVE TO GET STARTED!"
	}
	else if (document.getElementById("text-input").value=="help")
	{
		document.getElementById("story-output").innerHTML="<ul><li>1) SELECT A GENRE</li><li> </li><li>2) PLEASE ENTER A PHRASE ABOVE AND CLICK SUBMIT</li><li>OR</li><li>ENTER \"sample\" ABOVE TO GET A SAMPLE RANDOM STORY</li><li></li><li>3) TYPE \"help\" TO SHOW THIS PAGE AGAIN</li></ul>"
	}
	
	else{
    axios.get(url,{
		params: {
		  inputText: document.getElementById("text-input").value,
		  length: length	
		}
	  })
    .then(response =>{
		// var data=process((response.data)["OutputStory"]);
		setTimeout(function () {
			var data=(response.data)["OutputStory"];
			document.getElementById("story-output").innerHTML="<pre>"+(data)+"</pre>";
		}, 1000000);
		
  
    })
	.catch(error => document.getElementById("story-output").innerHTML="OOPS! SOMETHING WENT WRONG :(");
}
})

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
	const tts = window.speechSynthesis;
	const toSpeak = new SpeechSynthesisUtterance(textInput);
	const voiceName = window.speechSynthesis.getVoices()[0];
	toSpeak.voice = voiceName;
	tts.speak(toSpeak);
};

function loading() {
	// spinner
	let load = document.getElementById("loading-icon");
	load.style.display = "initial";
	document.getElementById("pertag").innerText="0.0 %"
	// progress bar
	if (i == 0) {
		i = 1;
		// var elem = document.getElementById("myBar");
		var width = 1;
		var id = setInterval(frame, 10);
		function frame() {
		  if (width >= 100) {
			clearInterval(id);
			i = 0;
		  } else {
			width=width+0.01; 
			document.getElementById("pertag").innerText=width.toFixed(1)+" %";
			// console.log((Math.round(width)).toString())
			// console.log(document.getElementById("myBar").style.width)
			document.getElementById("myBar").style.width = (Math.round(width)).toString()+"%";

		  }
		}
	  }
	  
}
