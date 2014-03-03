class ChangeConversions < ActiveRecord::Migration
  def change
    drop_table "conversions"
    create_table "conversions", force: true do |t|
    t.integer  "measure_a_id"
    t.integer  "measure_b_id"
    t.decimal   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
