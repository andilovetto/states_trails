class CreateTrails < ActiveRecord::Migration[7.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.boolean :seasonal_closures
      t.float :mileage
      t.integer :elevation
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
