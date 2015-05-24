class Office < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :games, through: :users
	has_one :mod

	validates :name, presence: true
end