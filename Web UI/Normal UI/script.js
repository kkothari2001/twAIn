let theme = "green";
let genre = "adventure";
let length = "medium";

function adventure() {
	if (genre !== "adventure") {
		let adventureb = document.getElementById("adventure");
		let horrorb = document.getElementById("horror");
		let actionb = document.getElementById("action");
		adventureb.classList.add("active");
		if (horrorb.classList.contains("active")) {
			horrorb.classList.remove("active");
		}

		if (actionb.classList.contains("active")) {
			actionb.classList.remove("active");
		}
		genre = "adventure";
		console.log(genre);
	}
}

function horror() {
	if (genre !== "horror") {
		let adventureb = document.getElementById("adventure");
		let horrorb = document.getElementById("horror");
		let actionb = document.getElementById("action");
		horrorb.classList.add("active");
		if (adventureb.classList.contains("active")) {
			adventureb.classList.remove("active");
		}

		if (actionb.classList.contains("active")) {
			actionb.classList.remove("active");
		}
		genre = "horror";
		console.log(genre);
	}
}

function action() {
	if (genre !== "action") {
		let adventureb = document.getElementById("adventure");
		let horrorb = document.getElementById("horror");
		let actionb = document.getElementById("action");
		actionb.classList.add("active");
		if (horrorb.classList.contains("active")) {
			horrorb.classList.remove("active");
		}

		if (adventureb.classList.contains("active")) {
			adventureb.classList.remove("active");
		}
		genre = "action";
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
	console.log(story);

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
