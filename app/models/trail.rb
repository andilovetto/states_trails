class Trail < ApplicationRecord
  belongs_to :state

  validates_presence_of :name
  validates_presence_of :mileage
  validates_presence_of :elevation
  validates_inclusion_of :seasonal_closures, in: [true, false]

  def self.with_seasonal_closures
    where(seasonal_closures: true)
  end

end





