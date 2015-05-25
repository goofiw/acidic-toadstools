class AddAddressToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :address, :string
  end
end