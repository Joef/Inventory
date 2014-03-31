class AddPackTInvoiceIngredients < ActiveRecord::Migration
  def change
    change_table :invoice_ingredients do |t|
      t.decimal :pack_qty
      t.decimal :pack_size
    end
  end
  
end
