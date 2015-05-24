post '/office/new' do
	# @password_match = (params[:password] == params[:password_confirm])
	@office = Office.new(
		               name: params[:name],
		               company_name: params[:company_name],
		               password: params[:password] ||= nil,
		               )
	if @office.save 
	#notify account creation
	puts @office.mod.inspect
	puts session[:user].inspect
	  mod = Mod.new(user_id: session[:user].id,
	  	            office_id: @office.id)

	  mod.save
	  session[:office_id] = @office.id 
	end
	redirect '/#offices'
end

post '/office/delete' do
	office = Office.find_by(name: params[:office_to_delete])
	if session[:user] && 
		office &&
		office.mod[:user_id] == session[:id] &&
		OfficesUsers.where(user_id: session[:id]).where(OfficesUsers.where(office_id: office.id))
		office.destroy
    redirect '/'
	else
		# office.errors.add(:problemDeleting, "You either do not have access or that is not a valid office")
		erb :index
	end
end
