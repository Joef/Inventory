class UpdateConversions < ActiveRecord::Migration
  def change
    remove_column :conversions, :quanity
    add_column :conversions, :quanity, :decimal, :precision => 8, :scale => 2 
  end
end
