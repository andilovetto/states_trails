class Trail < ApplicationRecord
  belongs_to :state

  def self.with_seasonal_closures
    where(seasonal_closures: true)
  end

end





