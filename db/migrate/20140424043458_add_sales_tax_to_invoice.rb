class AddSalesTaxToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :sales_tax, :decimal, :precision => 8, :scale => 2
  end
end
