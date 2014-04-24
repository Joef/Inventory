class ChangePrecisionOnLastPriceQuantity < ActiveRecord::Migration
  def change
    change_column :ingredients, :last_price, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :pack_qty, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :pack_size, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :qty_ordered, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :qty_shipped, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :price, :decimal, :precision => 8, :scale => 3
    change_column :invoice_ingredients, :extended, :decimal, :precision => 8, :scale => 3
  end
end
