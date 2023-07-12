# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  colorado = State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true)  
  alabama = State.create!(name: "Alabama", number_of_parks: 3, mountainous_terrain: true) 
  turkey_trot = Trail.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735, state_id: colorado.id) 
  mule_deer = colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000)
  hurricane_creek = alabama.trails.create!(name: "Hurricane Creek", seasonal_closures: false, mileage: 2, elevation: 50)

