require "rails_helper"

RSpec.describe "state show page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  
  before do     
    visit "/states/#{colorado.id}/edit"
  end

  it "updates state record" do
    fill_in "Name", with: "Virginia"
    fill_in "Number of parks", with: "3"
    fill_in "Mountainous terrain", with: true
    click_button "Update State"
    expect(current_path).to eq("/states/#{colorado.id}")
    expect(State.last.name).to eq("Virginia")
    expect(page).to have_content("Virginia")
  end



end