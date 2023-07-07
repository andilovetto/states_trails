class State < ApplicationRecord
  has_many :trails

  def self.states_by_created_at
    order('created_at DESC')  
  end

  def number_of_trails
    trails.count
  end

end
