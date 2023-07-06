class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :name
      t.integer :number_of_trails
      t.boolean :mountainous_terrain

      t.timestamps
    end
  end
end
