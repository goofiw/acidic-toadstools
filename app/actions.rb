require_relative 'user_authentication'
require_relative 'play_button'
require_relative 'office_creation'
requie_relative 'twilio_helper'
# Homepage (Root path)

helpers do
	
	def all_offices
		Office.all
	end

	def all_games
		Game.all
	end
end

get '/' do
  @user = User.new
  erb :index
end

get '/office/:id' do
  session[:office_id] = params[:id]
  session[:office_name] = Office.find(params[:id]).name
  redirect '/'
end

get 'game/destroy/:id'
#should delete the game with id params[:id]
end



