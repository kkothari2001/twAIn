function greenClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#4cd93a");
}

function blueClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#00fffc");
}

let main = document.getElementById("main");
let side = document.getElementById("controls");

side.addEventListener("mouseenter", function () {
	main.style.setProperty("left", "20vw");
	console.log(main);
});
side.addEventListener("mouseleave", function () {
	main.style.setProperty("left", "0vw");
	console.log(main);
});

let txtinput = document.getElementById("text-input");

txtinput.addEventListener("input", function () {
	let text = txtinput.value;
	if (text[text.length - 1] != "_") {
		text = text + "_";
	} else txtinput.value = text;
});


// Text to Speech
const speakOnClick = (textInput) => {
	const tts = window.speechSynthesis;
	const toSpeak = new SpeechSynthesisUtterance(textInput);
	const voiceName = window.speechSynthesis.getVoices()[0];
	toSpeak.voice = voiceName;
	tts.speak(toSpeak);
}
