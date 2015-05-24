
  //server return comments in json formate
$(getGameList)
$(get_matched)

function getGameList() {
	console.log("pulling")
  $("#gameList").load("/game_list");
	setTimeout(getGameList, 5000)
}

function get_matched() {
	console.log("matched?")
  $("#matched").load("/matched");
  setTimeout(get_matched, 10000)
}