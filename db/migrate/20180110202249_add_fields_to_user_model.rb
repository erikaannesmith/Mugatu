class AddFieldsToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :country_code, :string
  end
end
