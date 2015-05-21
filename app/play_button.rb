# case 1: 
# 	if no open game
# 		create new game record > this user_id, this_users_selected_office
# case 2:
# 	if open game (game record with nil visitor id) && user.office_id == game.office_id
# 		add this_user_id to record, send_out_email/sound/notification w/ matched user and instructions
# 		 

get '/play' do
	game_waiting = Game.find_by('visitor_id', 0)
	if game_waiting && session[:office_id] == game_waiting[:id]
    game_waiting.visitor_id = session[id]
    puts "need to send out a notification"
	else
		@game = Game.new(office_id: session[:office_id],
			               user_id: session[:id],
                     visitor_id: 0,
                     timeout: 900
			               )
	end
end