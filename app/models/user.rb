class User < ActiveRecord::Base
	has_and_belongs_to_many :offices
	has_many :games

  validates :email, :username, uniqueness: true, presence: true
  validates :password, presence: true


  def add_office(offices_id)
  	OfficesUsers.new( user_id: @id,
                      office_id: offices_id
                      )
  end
end