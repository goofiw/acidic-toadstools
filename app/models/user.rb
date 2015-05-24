class User < ActiveRecord::Base
	has_and_belongs_to_many :offices
	has_many :games

  validates :email, :username, uniqueness: true, presence: true
  validates :password, presence: true

  def add_office(office_id)
  	self.offices << Office.find(office_id)
  	self.save
  end
end