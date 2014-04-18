class AddMenuItemTypeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :menu_item_type, :integer
  end
end
