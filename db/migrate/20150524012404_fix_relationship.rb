class FixRelationship < ActiveRecord::Migration
  def change
  	remove_column :offices_users, :office_id
  	remove_column :offices_users, :user_id
    add_reference :offices_users, :user, index: true
    add_reference :offices_users, :office, index: true
  end
end
