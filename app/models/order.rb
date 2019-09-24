class Order < ApplicationRecord
  belongs_to :location
  belongs_to :user
  belongs_to :vehicle
  validates :start, :user_id, :vehicle_id, :end, :location_id, presence: true
  after_create :set_price

  def set_price
    self.price = (self.end-self.start)/3600 * self.vehicle.price
    self.save!
  end
end
