require_relative 'user_authentication'
require_relative 'play_button'
require_relative 'office_creation'
# Homepage (Root path)

helpers do
	def all_offices
		Office.all
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



