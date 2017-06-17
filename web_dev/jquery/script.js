/*
function addPinkBorder(event) {
  event.target.style.border = "2px solid pink";
}

function removePinkBorder(event) {
  event.target.style.border = null;
}

var photo = document.getElementById("lizard-photo");
photo.addEventListener("mouseover", addPinkBorder);
photo.addEventListener("mouseleave", removePinkBorder
*/

$("#lizard-photo").on({
  mouseenter: function(){
    $(this).css("border", "2px solid pink");
  },
  mouseleave: function(){
    $(this).css("border", 0);
  },
  click: function(){
    $(this).animate({
      width: "500px",
      margin: "80px"
    })
    .animate({
      width: "225px",
      margin: "0px"
    });
  }, 
});

$("#toggle-buttons").click(function(){
  $("button").fadeToggle("fast");
});



$(".hide").click(function(){
  $("#lizard-photo").hide("slow");
});

$(".reveal").click(function(){
  $("#lizard-photo").show("fast");
});