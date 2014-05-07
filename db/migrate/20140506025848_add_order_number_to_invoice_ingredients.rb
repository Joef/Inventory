class AddOrderNumberToInvoiceIngredients < ActiveRecord::Migration
  def change
    add_column :invoice_ingredients, :order_number, :integer
  end
end
