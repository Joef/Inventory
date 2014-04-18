class AddMenuItemTypeToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :menu_item_type, :integer
  end
end
