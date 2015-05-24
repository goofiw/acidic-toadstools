
  //server return comments in json formate
$(getGameList)

function getGameList() {
	console.log("pulling")
  $("#gameList").load("/game_list");
	setTimeout(getGameList, 5000)
}