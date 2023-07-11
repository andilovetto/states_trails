class State < ApplicationRecord
  has_many :trails, :dependent => :destroy

  def self.states_by_created_at
    order('created_at DESC')  
  end

  def number_of_trails
    trails.count
  end

  def alphabetical_trails
    trails.order(:name)
  end

end
