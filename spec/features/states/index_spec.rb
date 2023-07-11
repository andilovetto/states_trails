require "rails_helper"

RSpec.describe "states index page" do
  let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
  let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 2, mountainous_terrain: false) } 
  
  before do     
    visit "/states"
  end

  it "displays names of each state" do
    expect(page).to have_content(colorado.name)
    expect(page).to have_content(alabama.name)
  end

  it "displays states in order of creation with creation info" do
    expect(alabama.name).to appear_before(colorado.name)
  end

  # proving link is on all pages, also tested in spec/features/trails/index_spec.rb
  it "provides link to trail index at every page" do 
    expect(page).to have_link("Trail Index")
    click_link "Trail Index"
    expect(current_path).to eq("/trails")
  end

  # proving link is on all pages, also tested in spec/features/trails/index_spec.rb
  it "provides link to state index at every page" do 
    expect(page).to have_link("State Index")
    click_link "State Index"
    expect(current_path).to eq("/states")
  end

  it "has a link to create a new state" do
    expect(page).to have_link("New State")
    click_link "New State"
    expect(current_path).to eq("/states/new")
  end

  it "has a link to edit state record" do
    expect(page).to have_link("Edit #{colorado.name}")
    click_link "Edit #{colorado.name}"
    expect(current_path).to eq("/states/#{colorado.id}/edit")
  end

  it "has a link to delete state record" do
    expect(page).to have_link("Delete #{colorado.name}")
    click_link "Delete #{colorado.name}"
    expect(current_path).to eq("/states")
    expect(page).to_not have_content("#{colorado.name}")
  end
end