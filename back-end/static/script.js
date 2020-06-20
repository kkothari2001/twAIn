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
function action(){genre='action'}


let main = document.getElementById("main");
let side = document.getElementById("controls");

side.addEventListener("mouseenter", function () {
	main.style.setProperty("left", "20vw");
	//console.log(main);
});
side.addEventListener("mouseleave", function () {
	main.style.setProperty("left", "0vw");
	//console.log(main);
});

let txtinput = document.getElementById("text-input");

txtinput.addEventListener("input", function () {
	let text = txtinput.value;
	if (text[text.length - 1] != "_") {
		text = text + "_";
	} else txtinput.value = text;
});

var submit=document.getElementById("submit");
var url='http://127.0.0.1:8000/api/'+genre;
 
function process(str)
{
	var finstr="";
	for (var i=0;i<str.length;i++)
  {
	  var j=100;
	  if (i==j)
	  {
		finstr=finstr+str[i]+"\n"
		j=j+100
	  }
		
	  else
	  	finstr=finstr+str[i]
  }
  return finstr;
}

submit.addEventListener("click",function(){
    console.log("change")
    axios.get(url,{
		params: {
		  inputText: document.getElementById("text-input").value,	
		}
	  })
    .then(response =>{
		// var data=process((response.data)["OutputStory"]);
		var data=(response.data)["OutputStory"];
		document.getElementById("output").innerText=(data);
    })
    .catch(error => console.error(error));
})


