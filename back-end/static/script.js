var genre='adventure'

function greenClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#4cd93a");
}

function blueClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#00fffc");
}

function horror(){genre='horror'}
function adventure(){genre='adventure'}
function mystery(){genre='mystery'}

var submit=document.getElementById("submit");
var url='http://127.0.0.1:8000/api/'+genre;
 
submit.addEventListener("click",function(){

	document.getElementById("story-output").innerHTML="<div class=\"loadingio-spinner-eclipse-2we2o8onnes\" id=\"loading-icon\"> <div class=\"ldio-6hi50wurrob\"><div></div></div></div>"
	loading();

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
		}
	  })
    .then(response =>{
		// var data=process((response.data)["OutputStory"]);
		var data=(response.data)["OutputStory"];
		document.getElementById("story-output").innerHTML=(data);
  
    })
	.catch(error => console.error(error));
}
})

// Text to Speech
function speakStory() {
	let story = document.getElementById("story-output").innerHTML;
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
	let load = document.getElementById("loading-icon");
	load.style.display = "initial";
	
}
