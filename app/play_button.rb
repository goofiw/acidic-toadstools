# case 1: 
# 	if no open game
# 		create new game record > this user_id, this_users_selected_office
# case 2:
# 	if open game (game record with nil visitor id) && user.office_id == game.office_id
# 		add this_user_id to record, send_out_email/sound/notification w/ matched user and instructions
# 		 

get '/play' do
	if Game.find_by('visitor_id', nil)
		@game = Game.new(office_id: session[:office_id],
			               user_id: session[:id],

			               )