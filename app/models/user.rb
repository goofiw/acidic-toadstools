class User < ActiveRecord::Base
	has_and_belongs_to_many :offices
	has_many :games

  validates :email, :username, uniqueness: true, presence: true
  validates :password, presence: true

  def add_office(office_id)
  	puts OfficesUsers.find_by(user_id: @id, office_id: office_id).inspect
  	if OfficesUsers.find_by(user_id: @id, office_id: office_id)
	  		puts "should throw error!"
	  		errors.add(:duplicate, "We already have you connected with that office")
    else 
	  	self.offices << Office.find(office_id)
	  	self.save
	  end
  end
end