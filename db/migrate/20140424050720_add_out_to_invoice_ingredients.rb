class AddOutToInvoiceIngredients < ActiveRecord::Migration
  def change
    add_column :invoice_ingredients, :out_of_stock, :boolean
  end
end
