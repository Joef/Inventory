class CreateRecipeMenuItems < ActiveRecord::Migration
  def change
    create_table :recipe_menu_items do |t|
      t.integer :recipe_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
