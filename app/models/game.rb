class Game < ActiveRecord::Base
	belongs_to :user


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