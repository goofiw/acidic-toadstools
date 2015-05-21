class Timestamps < ActiveRecord::Migration
  def change
    add_timestamps :games
    add_timestamps :users
    add_timestamps :offices
  end
end
