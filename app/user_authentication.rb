post '/users/new' do
	@password_match = (params[:password] == params[:password_confirm])
	@user = User.new(
		               username: params[:username],
		               email: params[:email],
		               password: params[:password]
		               )
	if @password_match && @user.save 
	#notify account creation
	  session[:id] = @user.id
	  session[:username] = @user.username
	  session[:email] = @user.email
	  session[:user] = @user
	  #session[:office_id] = 1 # test code, need to implement office creation/connection
		redirect '/'
	else
		@user.errors.add(:pass_dont_match, "Passwords do not match")
		erb :index
	end
end

post '/user_sessions' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
  	session[:id] = @user.id
	  session[:username] = @user.username
	  session[:email] = @user.email
	  session[:user] = @user
    redirect '/'
  else
    @auth_error = true
    erb :index
  end
end

get '/logout' do
	session.clear
	redirect '/'
end
