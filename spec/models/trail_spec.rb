require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "relationships" do
    it { should belong_to  :state }
  end
end
