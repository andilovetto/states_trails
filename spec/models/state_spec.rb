require 'rails_helper'

RSpec.describe State, type: :model do
  describe "relationships" do
    it { should have_many :trails }
  end

  describe "class methods" do
    let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
    let!(:alabama) { State.create!(name: "Alabama", number_of_parks: 2, mountainous_terrain: false) }
    
    describe ".states_by_created_at" do
      it "orders states by creation" do
        expect(State.states_by_created_at).to eq([alabama, colorado])
      end
    end
  end

  describe "instance methods" do
    let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
    let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 
    
    describe "#number_of_trails" do
      it "counts number of trails by state" do
        expect(colorado.number_of_trails).to eq(1)
      end
    end
  end


end
