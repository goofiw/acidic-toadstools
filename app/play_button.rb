# case 1: 
# 	if no open game
# 		create new game record > this user_id, this_users_selected_office
# case 2:
# 	if open game (game record with nil visitor id) && user.office_id == game.office_id
# 		add this_user_id to record, send_out_email/sound/notification w/ matched user and instructions
# 		 

require_relative 'mailer.rb'


get '/play' do
  
  #guys super careful with this code.  Running it costs real money.
	# twilio_client.messages.create(
	# 	from: '+17782000868',
	# 	to: '+17787063656',
	# 	body: "I'm sending a message! (maybe)" 
 #  )

	@game = game_waiting
	if session[:office_id]  && !already_has_game?
		current_user_game = Game.find_by(user_id: session[:id])
		#game matched 
		if !!@game && session[:id] != @game.user_id
	    @game.visitor_id = session[:id]
			
			home_user = User.find(@game.user_id)
	    visitor_user = User.find(@game.visitor_id)

      mail(home_user, visitor_user)

	    puts "need to send out a notification"
	    @game.matched_at = DateTime.now
	    send_sms(User.find(session[:id]), User.find(@game.user_id))
		else
			@game = Game.new(office_id: session[:office_id],
				               user_id: session[:id],
	                     visitor_id: 0,
	                     timeout: 900,
	                     matched_at: DateTime.now
				               )
			puts "Creating a new Game"
		end
				@game.save
				redirect '/'
	else
		if !session[:office_id]
			@game.errors.add(:no_office, "Must select office to FOOS!")
		elsif already_has_game?
			@game.errors.add(:already_waiting, 
				               "You're already waiting for a game in your office")
		end
		erb :index
	end
end


def game_waiting
  Game.find_by(visitor_id: 0, office_id: session[:office_id])
end

def already_has_game?
  Game.find_by(user_id: session[:id], office_id: session[:office_id], visitor_id: 0) 
end

def send_sms(user, visitor)
	  #guys super careful with this code.  Running it costs real money.
	if user.phone  
	  twilio_client.messages.create(
		from: '+17782000868',
	 	to: "#{user.phone}",
	 	body: "You've been matched with #{visitor.username}" 
	  )
	end
	if visitor.phone
	  twilio_client.messages.create(
		from: '+17782000868',
	 	to: "#{visitor.phone}",
	 	body: "You've been matched with #{user.username}" 
	  )
	end
end



