class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
  end
end
