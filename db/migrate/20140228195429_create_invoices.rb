class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :invoice_date
      t.integer :vendor_id

      t.timestamps
    end
  end
end
