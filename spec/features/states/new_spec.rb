require "rails_helper"

RSpec.describe "states new page" do
  
  before do     
    visit "/states/new"
  end

  it "provides form for creating new state" do
    fill_in "Name", with: "Virginia"
    fill_in "Number of parks", with: "3"
    fill_in "Mountainous terrain", with: true
    click_button "Create State"
    expect(current_path).to eq("/states")
    expect(State.last.name).to eq("Virginia")
    expect(page).to have_content("Virginia")
  end
end 