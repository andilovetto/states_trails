require "rails_helper"

RSpec.describe "trails index page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 2, mountainous_terrain: false) }
  let!(:turkey_trot) { Trail.create!(name: "Turkey Trot", seasonal_closures: true, mileage: 3.4, elevation: 735, state_id: colorado.id) } 
  let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 
  let!(:hurricane_creek) { alabama.trails.create!(name: "Hurricane Creek", seasonal_closures: true, mileage: 2, elevation: 50) } 
  let!(:big_tree) { alabama.trails.create!(name: "Big Tree", seasonal_closures: false, mileage: 12, elevation: 50) } 

  before do     
    visit "/trails"
  end

  it "displays trails and their attributes" do
    expect(page).to have_content(turkey_trot.name)
    expect(page).to have_content(mule_deer.name)
    expect(page).to have_content(turkey_trot.seasonal_closures)
    expect(page).to have_content(mule_deer.seasonal_closures)
    expect(page).to have_content(turkey_trot.mileage)
    expect(page).to have_content(mule_deer.mileage)
    expect(page).to have_content(turkey_trot.elevation)
    expect(page).to have_content(mule_deer.elevation)
    expect(page).to have_content(alabama.id)
    expect(page).to have_content(hurricane_creek.name)
    expect(page).to have_content(colorado.id)
  end

  # proving link is on all pages, also tested in spec/features/states/index_spec.rb
  it "provides link to trail index at every page" do 
    expect(page).to have_link("Trail Index")
    click_link "Trail Index"
    expect(current_path).to eq("/trails")
  end

  # proving link is on all pages, also tested in spec/features/states/index_spec.rb
  it "provides link to state index at every page" do 
    expect(page).to have_link("State Index")
    click_link "State Index"
    expect(current_path).to eq("/states")
  end

  it "displays trails with no seasonal closures" do
    expect(page).to have_content(turkey_trot.name)
    expect(page).to have_content(mule_deer.name)
    expect(page).to_not have_content(big_tree.name)
  end
end