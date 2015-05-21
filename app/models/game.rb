class Game < ActiveRecord::Base
	belongs_to :user, :office
end