post '/office/new' do
	# @password_match = (params[:password] == params[:password_confirm])
	@office = Office.new(
		               name: params[:name],
		               company_name: params[:company_name],
		               password: params[:password] ||= nil
		               )
	if @office.save 
	#notify account creation
	  session[:office_id] = @office.id 
	end
	redirect '/#offices'
end