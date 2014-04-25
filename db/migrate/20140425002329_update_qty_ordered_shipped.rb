class UpdateQtyOrderedShipped < ActiveRecord::Migration
  def change
    change_column :invoice_ingredients, :qty_ordered, :decimal, :precision => 4, :scale => 1
    change_column :invoice_ingredients, :qty_shipped, :decimal, :precision => 4, :scale => 1
  end
end
