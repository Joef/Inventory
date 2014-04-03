class UpdateRecipeColumns < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :cost
    remove_column :recipe_ingredients, :total_cost
    remove_column :recipe_ingredients, :menu_item_id
  end
end
