function greenClick() {
	let root = document.documentElement;
	root.style.setProperty("--main-opp-color", "#4cd93a");
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
const speakOnClick = (textInput) => {
	const tts = window.speechSynthesis;
	const toSpeak = new SpeechSynthesisUtterance(textInput);
	const voiceName = window.speechSynthesis.getVoices()[0];
	toSpeak.voice = voiceName;
	tts.speak(toSpeak);
};
