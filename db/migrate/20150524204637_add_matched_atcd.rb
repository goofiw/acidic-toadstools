class AddMatchedAtcd < ActiveRecord::Migration
  def change
  	add_column :games, :matched_at, :datetime
  end
end
