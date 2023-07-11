require "rails_helper"

RSpec.describe "state's trails new page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:turkey_trot) { colorado.trails.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735) } 

  
  before do     
    visit "/states/#{colorado.id}/trails/new"
  end

  it "provides form for creating new trail within state" do
    fill_in "Name", with: "Green Mountain West Ridge"
    fill_in "Seasonal closures", with: false
    fill_in "Mileage", with: 4.0
    fill_in "Elevation", with: 721
    click_button "Create Trail"
    expect(current_path).to eq("/states/#{colorado.id}/trails")
    expect(Trail.last.name).to eq("Green Mountain West Ridge")
    expect(page).to have_content("Green Mountain West Ridge")
  end
end 