class AddMeasureTypeToMeasures < ActiveRecord::Migration
  def change
    add_column :measures, :measure_type, :boolean
  end
end
