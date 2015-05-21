get '/create' do
  erb :create
end

post '/create' do
	@password_match = (params[:password] == params[:password_confirm])
	@user = User.new(
		               username: params[:username],
		               password: params[:password]
		               )
	if @password_match && @user.save 
	#notify account creation
	  session[:id] = @user.id
		redirect '/'
	else
		erb :create
	end
end

get '/signin' do
	erb :signin
end

post '/signin' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
		session[:id] = user.id
		@errors = nil
		redirect '/'
	else
		@errors = "Username or password is not correct"
		erb :signin
	end
end

get '/logout' do
	session[:id] = nil
	redirect '/'
end
