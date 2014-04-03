class AddCostBasisToInvoiceIngredients < ActiveRecord::Migration
  def change
     add_column :invoice_ingredients, :cost_basis, :integer
     add_column :ingredients, :measure_id, :integer
  end
end
