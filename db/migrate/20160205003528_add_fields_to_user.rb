class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :gender, :string
    add_column :users, :weight, :integer
    add_column :users, :weight_unit, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :postcode, :string
    add_column :users, :is_admin, :boolean
  end
end