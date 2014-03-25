class AddHierarchyToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :parent_id, :integer
    add_column :categories, :custom, :boolean
  end
end
