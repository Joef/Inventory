class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.decimal :price
      t.decimal :margin

      t.timestamps
    end
  end
end
