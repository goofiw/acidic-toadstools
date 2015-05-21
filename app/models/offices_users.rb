class OfficesUsers < ActiveRecord::Base
  has_many :users, :offices
end
