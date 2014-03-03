class UpdateConversionsAgain < ActiveRecord::Migration
  def change
    remove_column :conversions, :quanity
    remove_column :conversions, :quantity
    add_column :conversions, :quantity, :decimal, :precision => 8, :scale => 2 
  end
end
