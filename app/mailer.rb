require 'action_mailer'

class OfficeFoosMailer < ActionMailer::Base
  default from: 'officefoos@matsuba.ca'

  def email_notifier(recipient, username, otheruser)
    mail( from: 'officefoos@matsuba.ca',
		      to: recipient,
		      subject: "Office Foos Match! Go Meet #{otheruser} at the table now!",
		      body: "#{username} you have been matched with #{otheruser} go meet at the table!"
      )  
  end
end

ActionMailer::Base.smtp_settings = 
  {:address => 'smtp.gmail.com',
  :port => 587,
  :user_name => 'officefoos@matsuba.ca',
  :domain => 'matsuba.ca',
  :password => ENV['EMAIL_PASSWORD'],
  :authentication => :login }

def mail(home_user, visitor_user)
	begin  
      if (home_user.notification == nil) || (home_user.notification == 'E')  || (home_user.notification == 'B')
       OfficeFoosMailer.email_notifier(home_user.email, home_user.username, visitor_user.username).deliver_now
    end
  rescue Net::SMTPFatalError
    puts "home_user sucks"
  end

  begin
    if (visitor_user.notification == nil) || (visitor_user.notification == 'E')  || (visitor_user.notification == 'B')
       OfficeFoosMailer.email_notifier(visitor_user.email, visitor_user.username, home_user.username).deliver_now
    end
  rescue Net::SMTPFatalError
      puts "visitor email sucks"
  end
end