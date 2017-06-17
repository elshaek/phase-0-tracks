function addPinkBorder(event) {
  event.target.style.border = "2px solid pink";
}

function removePinkBorder(event) {
  event.target.style.border = null;
}

var photo = document.getElementById("lizard-photo");
photo.addEventListener("mouseover", addPinkBorder);
photo.addEventListener("mouseleave", removePinkBorder);

$(".hide").click(function(){
  $("#lizard-photo").hide();
});

$(".reveal").click(function(){
  $("#lizard-photo").show();
});