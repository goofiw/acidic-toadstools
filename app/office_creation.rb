post '/office/new' do
	# @password_match = (params[:password] == params[:password_confirm])
	@office = office.new(
		               name: params[:officename],
		               password: params[:password] ||= nil
		               )
	if @office.save 
	#notify account creation
	  session[:office_id] = id 
	end
	redirect '/'
end