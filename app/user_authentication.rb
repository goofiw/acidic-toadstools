post '/users/new' do
	@password_match = (params[:password] == params[:password_confirm])
	@user = User.new(
		               username: params[:username],
		               email: params[:email],
		               password: params[:password]
		               )
	if @password_match && @user.save 
	#notify account creation
	  session[:username] = @user.username
	  session[:email] = @user.email
		redirect '/'
	else
		redirect '/'
	end
end

post '/user_sessions' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
	  session[:username] = @user.username
	  session[:email] = @user.email
    redirect '/'
  else
  	@errors = "Username or password is not correct"
    redirect '/'
  end
end

get '/logout' do
	session.clear
	redirect '/'
end
