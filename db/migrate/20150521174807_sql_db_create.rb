class SqlDbCreate < ActiveRecord::Migration
  def change

  	create_table :offices do |t|
  		t.string :name
  		t.string :password
  		t.boolean :public
  	end

  	create_table :users do |t|
  		t.string :username
  		t.string :email
  		t.string :password
  	end

  	create_table :offices_users do |t|
  		t.references :office
  		t.references :user
  		t.integer :mod_id
  	end

  	create_table :games do |t|
  		t.references :office
  		t.references :user
  		t.integer :visitor_id
  		t.integer :timeout 
  		t.datetime
  	end

  end
end
