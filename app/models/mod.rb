class Mod < ActiveRecord::Base
  belongs_to :office
	has_many :users
end