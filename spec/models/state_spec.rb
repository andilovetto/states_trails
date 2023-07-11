require 'rails_helper'

RSpec.describe State, type: :model do
  describe "relationships" do
    it { should have_many :trails }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :number_of_parks }
    #it { should validate_inclusion_of :mountainous_terrain } couldn't find a way to test boolean validations
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
    let!(:turkey_trot) { colorado.trails.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735) } 
    let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 
    
    describe "#number_of_trails" do
      it "counts number of trails by state" do
        expect(colorado.number_of_trails).to eq(2)
      end
    end

    describe "#alphabetical_trails" do
      it "alphabetizes trails" do
        expect(colorado.alphabetical_trails).to eq([mule_deer, turkey_trot])
      end
    end

    describe "#mileage_filter" do
      it "filters by mileage" do
        expect(colorado.mileage_filter(15)).to eq([mule_deer])
      end
    end
  end
end
