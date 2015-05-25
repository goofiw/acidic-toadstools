class User < ActiveRecord::Base
	has_and_belongs_to_many :offices
	has_many :games

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
  
  validates :username, presence: true
  
  validates :email,  
  					presence: true,
  					format: { with: VALID_EMAIL_REGEX }, 
	          uniqueness: { case_sensitive: false }
  validates :password, 
  					presence: true


  def add_office(office_id)
  	if OfficesUsers.find_by(user_id: id, office_id: office_id)
	  		puts "should throw error!"
	  		errors.add(:duplicate, "We already have you connected with that office")
    else 
	  	self.offices << Office.find(office_id)
	  	self.save
	  end
  end
end