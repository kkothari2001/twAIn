let header = document.getElementsByTagName("header")[0];
let titleanimid;
let colors = ["#6bff63", "#61faf7", "#ff59f7"];

header.addEventListener("click", function () {
	console.log("click");
	let title = document.getElementById("title");
	let spread = 100;
	titleanimid = setInterval(function () {
		title.style.top = (Math.random() * spread - spread / 2).toString() + "%";
		title.style.left = (Math.random() * spread - spread / 2).toString() + "%";
		title.style.fontSize = (Math.random() * 50 + 2).toString() + "rem";
		title.style.color = colors[Math.floor(Math.random() * 4)];
	}, 150);
	setTimeout(function () {
		clearInterval(titleanimid);
		title.style.top = 0;
		title.style.left = 0;
		title.style.fontSize = "6rem";
		title.style.color = "var(--light)";
	}, 2000);
});
