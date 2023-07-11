require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "relationships" do
    it { should belong_to  :state }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :mileage }
    it { should validate_presence_of :elevation }
    #it { should validate_inclusion_of :seasonal_closures } couldn't find a way to test boolean validations
  end

  describe "class methods" do
    let!(:colorado) { State.create!(name: "Colorado", number_of_parks: 3, mountainous_terrain: true) } 
    let!(:turkey_trot) { Trail.create!(name: "Turkey Trot", seasonal_closures: false, mileage: 3.4, elevation: 735, state_id: colorado.id) } 
    let!(:mule_deer) { colorado.trails.create!(name: "Mule Deer", seasonal_closures: true, mileage: 17, elevation: 1000) } 
    
    it ".with_seasonal_closures" do
      expect(Trail.with_seasonal_closures).to eq([mule_deer])
    end
  end
end
