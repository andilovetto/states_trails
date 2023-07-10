require "rails_helper"

RSpec.describe "trail edit page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:turkey_trot) { colorado.trails.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735) } 
  
  before do     
    visit "/trails/#{turkey_trot.id}/edit"
  end

  it "updates trail record" do
    fill_in "Name", with: "Turkey Trot"
    fill_in "Seasonal closures", with: true
    fill_in "Mileage", with: 3.7
    fill_in "Elevation", with: 789
    click_button "Update Trail"
    expect(current_path).to eq("/trails/#{turkey_trot.id}")
    expect(Trail.last.seasonal_closures).to eq(true)
    expect(Trail.last.mileage).to eq(3.7)
    expect(Trail.last.elevation).to eq(789)
    expect(page).to have_content(3.7)
    expect(page).to have_content(789)
    expect(page).to have_content(true)
  end
end