class RenameMeasureId < ActiveRecord::Migration
  def change
    rename_column :recipes, :serving_measure_id, :measure_id
  end
end
