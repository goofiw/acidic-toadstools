class Game < ActiveRecord::Base
	belongs_to :user

	after_save :update_waiting_user

	def update_waiting_user
		game.matched = visitor_id_changed?
	end

  def getOffice
  	begin 
	  	Office.find(office_id) 
	  rescue ActiveRecord::RecordNotFound
	  	puts "could not find office with getOffice"
	  	puts office_id.inspect
	  	Office.find(1)
	  end
	end

  def to_s
  	"ID: #{id} Home: #{user_id} Away: #{visitor_id} office: #{office_id}"
  end
end