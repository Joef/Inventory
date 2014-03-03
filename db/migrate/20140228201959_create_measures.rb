class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
