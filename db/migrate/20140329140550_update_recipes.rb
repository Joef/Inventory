class UpdateRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :parent_id, :integer
    rename_column :recipes, :price, :cost
    
    change_table :recipe_ingredients do |t|
      t.decimal :cost
      t.decimal :total_cost
      t.decimal :quantity
      t.integer :ingredient_id
      t.integer :measure_id
    end 
    
    drop_table :recipe_menu_items
    
    add_column :menu_items, :recipe_id, :integer
  end
end
