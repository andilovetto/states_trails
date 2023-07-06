require "rails_helper"

RSpec.describe "state show page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_trails: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_trails: 2, mountainous_terrain: false) } 
  
  before do     
    visit "/states/#{colorado.id}"
  end

  it "displays state attributes" do
    expect(page).to have_content(colorado.name)
    expect(page).to have_content(colorado.number_of_trails)
    expect(page).to have_content(colorado.mountainous_terrain)
    expect(page).to have_content(colorado.id)
    expect(page).to_not have_content(alabama.name)
  end
end