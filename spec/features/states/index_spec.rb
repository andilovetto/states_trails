require "rails_helper"

RSpec.describe "states index page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_trails: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_trails: 2, mountainous_terrain: false) } 
  
  before do     
    visit "/states"
  end

  it "displays names of each state" do
    expect(page).to have_content(colorado.name)
    expect(page).to have_content(alabama.name)
  end
end