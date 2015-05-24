class OfficesUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :office

  validate :only_add_association_once

  def only_add_association_once
  	puts "Validating"
  	puts OfficeUsers.find_by(user_id: @user_id, office_id: @office_id)
  		puts "should throw error!"
  		errors.add(:duplicate, "We already have you connected with that office")
  end
end
