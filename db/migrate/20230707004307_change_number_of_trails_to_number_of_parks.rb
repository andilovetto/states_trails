class ChangeNumberOfTrailsToNumberOfParks < ActiveRecord::Migration[7.0]
  def change
    rename_column :states, :number_of_trails, :number_of_parks
  end
end
