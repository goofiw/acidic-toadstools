class Mod < ActiveRecord::Migration
  def change
  	create_table :mods do |t|
  		t.references :user, index: true
  		t.belongs_to :office
  	end
  end
end
