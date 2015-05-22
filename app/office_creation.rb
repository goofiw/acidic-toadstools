post '/office/new' do
	# @password_match = (params[:password] == params[:password_confirm])
	@office = Office.new(
		               name: params[:name],
		               password: params[:password] ||= nil
		               )
	if @office.save 
	#notify account creation
	  session[:office_id] = @office.id 
	end
	redirect '/'
end