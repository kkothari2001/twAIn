function greenClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#69ff56");
}

function blueClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#00fffc");
}

// let main = document.getElementById("main");
// let side = document.getElementById("controls");

// side.addEventListener("mouseenter", function () {
// 	side.style.setProperty("left", "19vw");
// });
// side.addEventListener("mouseleave", function () {
// 	side.style.setProperty("left", "0vw");
// });

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
	setTimeout(function () {
		load.style.display = "none";
	}, 1000);
}
