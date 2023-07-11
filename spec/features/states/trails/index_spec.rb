require "rails_helper"

RSpec.describe "trails index page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:turkey_trot) { Trail.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735, state_id: colorado.id) } 
  let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 
  let!(:hurricane_creek) { alabama.trails.create!(name: "Hurricane Creek", seasonal_closures: false, mileage: 2, elevation: 50) } 

  before do     
    visit "/states/#{colorado.id}/trails"
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
    expect(page).to have_content(colorado.id)
    expect(page).to_not have_content(alabama.id)
    expect(page).to_not have_content(hurricane_creek.name)
  end

  it "can sort trails alphabetically" do
    click_link "Sort Trails"
    expect(current_path).to eq("/states/#{colorado.id}/trails")
    expect(mule_deer.name).to appear_before(turkey_trot.name)
  end

  it "provides link to edit all trails" do
    expect(page).to have_link ("Edit #{turkey_trot.name}")
    click_link "Edit #{turkey_trot.name}"
    expect(current_path).to eq("/trails/#{turkey_trot.id}/edit")
  end

  it "deletes trail records" do
    expect(page).to have_link("Delete #{turkey_trot.name}")
    click_link "Delete #{turkey_trot.name}"
    expect(current_path).to eq("/trails")
    expect(page).to_not have_content("#{turkey_trot.name}")
  end

  it "displays records with given number value for mileage" do
    expect(page).to have_button("Apply")
    fill_in :mileage, with: "10"
    click_button "Apply"
    expect(page).to have_content(mule_deer.name)
    expect(page).to_not have_content(turkey_trot.name)
  end
end