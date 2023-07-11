class State < ApplicationRecord
  has_many :trails, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :number_of_parks
  validates_inclusion_of :mountainous_terrain, in: [true, false]

  def self.states_by_created_at
    order('created_at DESC')  
  end

  def number_of_trails
    trails.count
  end

  def alphabetical_trails
    trails.order(:name)
  end

  def mileage_filter(mileage)
    trails.where("mileage >= ?", mileage)   
  end
  #first mileage represents the column and the 2nd mileage represents the
  # argument passed in with the form ? represents the argument and protects from 
  # SQL injection

end
