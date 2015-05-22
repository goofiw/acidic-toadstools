def twilio_client

	account_sid = 'AC5d0835c95186604f700cc06a12b00c66' 
	auth_token = 'e1ad03615a57b1fcfb8001d02d4f07e9' 
	 
	# set up a client to talk to the Twilio REST API 
  Twilio::REST::Client.new account_sid, auth_token 
end 
