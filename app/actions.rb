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

  def get_current_username
    User.find(session[:id]).username
  end

  def active_games
    Game.find_by_sql("SELECT * FROM games
                      WHERE visitor_id = 0")
    # User.find(home_player)
  end

  #dry it up
  def your_recent_matches
    games = Game.where(user_id: session[:id]).where("matched_at IS NOT NULL")
    recent_games = []
    
    games.each do |game| 

      if game.matched_at
        recent_games << game if (Time.now - game.matched_at).to_i < 300
      end
    end

    games = Game.where(visitor_id: session[:id]).where("matched_at IS NOT NULL")
    games.each do |game| 

      if game.matched_at
        recent_games << game if (Time.now - game.matched_at).to_i < 300
      end
    end
    recent_games
  end

  def get_other_user_name(game)
    user = User.find(game.user_id).username
    if session[:id] == game.user_id
      user = User.find(game.visitor_id).username
    end
    user
  end

  def get_office_mod_name(office)
    User.find(office.mod[:user_id]).username
  end

  def get_office_contact_email(office)
    User.find(office.mod[:user_id]).email
  end

end

get '/matched' do
  puts Time.now.to_i
  games = your_recent_matches
  erb :_matched, layout:false if !games.empty? #if your game#matched
end

get '/game_list' do
  erb :_active_game_list, layout: false
end

get '/' do
  if session[:id]
    @user = User.find(session[:id])
  else
    @user = User.new
  end
  erb :index, :layout => (request.xhr? ? false : :layout)
end

get '/office/:id' do
  session[:office_id] = params[:id]
  session[:office_name] = Office.find(params[:id]).name
  session[:company_name] = Office.find(params[:id]).company_name

  redirect '/#intro'
end

get '/game/destroy/:id' do
  #should delete the game with id params[:id]
  Game.find(params[:id]).destroy
  redirect '/#games'
end

get '/user/add_number' do
  erb :'_phone_number_entry'
end

post '/user/register' do
  @phone_number = Sanitize.clean(params[:phone_number])
  if @phone_number.empty?
    redirect to("/")
  end
 
  begin
    if @error == false
      user = User.find(session[:id])
 
      if user.verified == true
        @phone_number = url_encode(@phone_number)
        redirect to("/verify?phone_number=#{@phone_number}&verified=1")
      end
      totp = ROTP::TOTP.new("bombidiggty")
      code = totp.now
 
      user.code = code
      user.save
   twilio_client.messages.create(from: '+17782000868',
                                 to: "#{user.number}",
                                 body: "Your code from office foos: #{code}" 
   )
    end
    erb :'_phone_number_verificaion'
  rescue
    redirect '/'
  end
end

post '/verify' do
  user = find(session[:id])
  user.phone_number = Sanitize.clean(params[:phone_number])
 
  code = Sanitize.clean(params[:code])
  if user.verified == true
    @verified = true
  elsif user.nil? or user.code != code
    redirect '/'
  else
    user.verified = true
    user.save
  end
  erb :verified
end


