// 9.2
// Release 1: Include a JS File in a Page
var subheaders = document.getElementsByTagName("h3");
for (i=0; i < 3; i++) {
  subheaders[i].style.color = "orange";
}

var firstPara = document.getElementById("firstParagraph");
firstPara.insertAdjacentHTML("afterend", "<p>Newly inserted paragraph: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>");


// Release 2: Add an Event Listener
var doggo = document.getElementsByTagName("img")[0];
doggo.addEventListener("mouseover", addBorder);
doggo.addEventListener("mouseleave", removeBorder);

function addBorder(event){
  //console.log(event);
  event.target.style.border = "2px solid green";
}

function removeBorder(event){
  //console.log(event);
  event.target.style.border = null;
}