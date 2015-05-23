class AddCompanyToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :company_name, :string
  end
end
