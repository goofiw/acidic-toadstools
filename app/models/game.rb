class Game < ActiveRecord::Base
	belongs_to :user

  def getOffice
  	Office.find(office_id) if Office.all > 0
  end

  def to_s
  	"ID: #{id} Home: #{user_id} Away: #{visitor_id} office: #{office_id}"
  end
end