class AddColumnsToInvoiceIngredients < ActiveRecord::Migration
  def up
    change_table :invoice_ingredients do |t|
      t.rename :quantity, :qty_ordered
      t.decimal :qty_shipped
      t.string :brand
      t.string :item_number
      t.string :vendor_number
      t.text   :description
      t.string :unit
      t.decimal :pack
    end
  end
  
  def down
    change_table :invoice_ingredients do |t|
      t.rename :qty_ordered, :quantity
      t.remove :qty_shipped
      t.remove :brand
      t.remove :item_number
      t.remove :vendor_number
      t.remove :description
      t.remove :unit
      t.remove :pack
    end
  end
end
