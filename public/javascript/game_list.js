
  //server return comments in json formate
$(document).ready(function() { 

  polling()

});

function polling() {
	console.log("pulling")
  // $("#games").load("/game_list");
  $("#matched").load("/matched");
	setTimeout(polling, 10000)
}
