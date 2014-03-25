class ChangeBooleanFlags < ActiveRecord::Migration
  def change
      remove_column :categories, :custom
      add_column :categories, :custom, :integer
      
      remove_column :ingredients, :custom
      add_column :ingredients, :custom, :integer
  end
end
