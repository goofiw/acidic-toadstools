require_relative 'twilio_helper'
require_relative 'user_authentication'
require_relative 'play_button'
require_relative 'office_creation'
require_relative 'game_display_helper'

# Homepage (Root path)

helpers do
	
	def all_offices
		Office.all
	end

	def all_games
		Game.all
	end
end

get '/game_list' do
  erb :_active_game_list, layout: false
end

get '/' do
  @user = User.new
  erb :index, :layout => (request.xhr? ? false : :layout)
end

get '/office/:id' do
  user = User.find(session[:id])
  user.add_office(params[:id])

  session[:office_id] = params[:id]
  session[:office_name] = Office.find(params[:id]).name
  session[:company_name] = Office.find(params[:id]).company_name

  redirect '/#offices'
end

get '/game/destroy/:id' do
  #should delete the game with id params[:id]
  Game.find(params[:id]).destroy
  redirect '/#games'
end