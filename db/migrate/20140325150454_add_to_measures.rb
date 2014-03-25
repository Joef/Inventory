class AddToMeasures < ActiveRecord::Migration
  def change
    change_table :measures do |t|
      t.integer :volume_weight
      t.integer :english_metric
      t.integer :custom
    end
  end
end
