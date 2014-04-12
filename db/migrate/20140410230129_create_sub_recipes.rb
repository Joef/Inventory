class CreateSubRecipes < ActiveRecord::Migration
  def change
    create_table :sub_recipes do |t|
      t.integer   :recipe_a_id
      t.integer   :recipe_b_id
      t.decimal   :servings
      t.timestamps
    end
  end
end
