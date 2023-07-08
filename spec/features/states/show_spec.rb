require "rails_helper"

RSpec.describe "state show page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 2, mountainous_terrain: false) } 
  
  before do     
    visit "/states/#{colorado.id}"
  end

  it "displays state attributes" do
    expect(page).to have_content(colorado.name)
    expect(page).to have_content(colorado.number_of_parks)
    expect(page).to have_content(colorado.mountainous_terrain)
    expect(page).to have_content(colorado.id)
    expect(page).to_not have_content(alabama.name)
  end

  it "displays number of trails in state" do
    expect(page).to have_content("Number of Trails: #{colorado.trails.count}")
  end

  it "provides link to trails" do
    expect(page).to have_link("#{colorado.name} Trails")
    click_link "#{colorado.name} Trails"
    expect(current_path).to eq("/states/#{colorado.id}/trails")
  end

  it "updates state info" do
    expect(page).to have_link("Update #{colorado.name}")
    click_link "Update #{colorado.name}"
    expect(current_path).to eq("/states/#{colorado.id}/edit")
  end

end