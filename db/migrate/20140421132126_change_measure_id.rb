class ChangeMeasureId < ActiveRecord::Migration
  def change
    change_column :recipes, :measure_id, :integer
  end
end
