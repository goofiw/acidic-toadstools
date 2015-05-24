class Indextomod < ActiveRecord::Migration
  def change
  	add_foreign_key :mods, :office, index: true
  end
end
