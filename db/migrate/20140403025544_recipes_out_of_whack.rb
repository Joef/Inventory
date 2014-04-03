class RecipesOutOfWhack < ActiveRecord::Migration
  def change
    remove_column :recipes, :cost
    add_column :recipes, :serving_quantity, :decimal
    add_column :recipes, :serving_size, :decimal
    add_column :recipes, :serving_measure_id, :decimal
    
  end
end
