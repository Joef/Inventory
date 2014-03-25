class AddDetailsToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :parent_id, :integer
    add_column :ingredients, :custom, :boolean
  end
end
