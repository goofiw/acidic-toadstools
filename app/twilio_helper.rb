def twilio_client

	account_sid = ENV['ACCOUNT_SID'] 
	auth_token = ENV['AUTH_TOKEN'] 
	puts account_sid 
	puts auth_token
	# set up a client to talk to the Twilio REST API 
  Twilio::REST::Client.new account_sid, auth_token 
end 
