require "rails_helper"

RSpec.describe "trails index page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 2, mountainous_terrain: false) }
  let!(:turkey_trot) { Trail.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735, state_id: colorado.id) } 
  let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 

  before do     
    visit "/trails/#{turkey_trot.id}"
  end

  it "displays a trail id with all attributes" do
    expect(page).to have_content(turkey_trot.name)
    expect(page).to have_content(turkey_trot.seasonal_closures)
    expect(page).to have_content(turkey_trot.mileage)
    expect(page).to have_content(turkey_trot.elevation)
    expect(page).to have_content(colorado.id)
  end

  it "updates trail info" do
    expect(page).to have_link("Update #{turkey_trot.name}")
    click_link "Update #{turkey_trot.name}"
    expect(current_path).to eq("/trails/#{turkey_trot.id}/edit")
  end
end