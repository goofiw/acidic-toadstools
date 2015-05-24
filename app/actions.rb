require_relative 'twilio_helper'
require_relative 'user_authentication'
require_relative 'play_button'
require_relative 'office_creation'

# Homepage (Root path)

helpers do
	
	def all_offices
		Office.all
	end

	def all_games
		Game.all
	end

  def all_user_offices
    #should scrub session[:id]
    Office.find_by_sql("SELECT * FROM offices
                  JOIN offices_users
                  ON offices.id=offices_users.office_id
                  WHERE user_id = #{session[:id]}")
  end

  def active_games
    Game.find_by_sql("SELECT * FROM games
                      WHERE visitor_id = 0")
    # User.find(home_player)
  end
end

get '/matched' do
  erb :_matched, layout:false #if your game#matched
  #game#matched = false
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