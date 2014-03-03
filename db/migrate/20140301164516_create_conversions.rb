class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.integer :measure_a_id
      t.integer :measure_b_id
      t.string :quantity
      t.string :decimal

      t.timestamps
    end
  end
end
