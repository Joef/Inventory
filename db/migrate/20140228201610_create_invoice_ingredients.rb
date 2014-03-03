class CreateInvoiceIngredients < ActiveRecord::Migration
  def change
    create_table :invoice_ingredients do |t|
      t.integer :invoice_id
      t.integer :ingredient_id
      t.integer :measure_id
      t.decimal :quantity
      t.decimal :price
      t.decimal :extended

      t.timestamps
    end
  end
end
