class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :address_city
      t.string :address_state
      t.string :address_postal_code

      t.timestamps
    end
  end
end
