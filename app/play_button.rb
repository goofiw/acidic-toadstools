# case 1: 
# 	if no open game
# 		create new game record > this user_id, this_users_selected_office
# case 2:
# 	if open game (game record with nil visitor id) && user.office_id == game.office_id
# 		add this_user_id to record, send_out_email/sound/notification w/ matched user and instructions
# 		 

get '/play' do
	game = game_waiting
	current_user_game = Game.find_by(user_id: session[:id]) 
	if !!game && session[:id] != game.user_id
    game.visitor_id = session[:id]
    puts "need to send out a notification"
	else
		unless already_has_game?
			game = Game.new(office_id: session[:office_id],
				               user_id: session[:id],
	                     visitor_id: 0,
	                     timeout: 900
				               )
			puts "Creating a new Game"
    end
	end
			game.save
			redirect '/'
end

def game_waiting
  Game.find_by(visitor_id: 0, office_id: session[:office_id])
end

def already_has_game?
	!!Game.find_by(user_id: session[:id], office_id: session[:office_id])
end