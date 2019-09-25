class Order < ApplicationRecord
  belongs_to :location
  belongs_to :user
  belongs_to :vehicle
  validates :start, :user_id, :vehicle_id, :end, :location_id, presence: true
  after_create :set_price
  
  def paypal_url(return_path)
    values = {
        business: "dataerror0-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "https://c2454f80df8645668fcd790fdc87b9b3.vfs.cloud9.us-east-2.amazonaws.com/#{return_path}?status=ok",
        invoice: self.id,
        amount: self.price,
        item_name: "payment",
        item_number: self.id,
        quantity: '1'
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
  
  def set_price
    self.price = (self.end-self.start)/3600 * self.vehicle.price
    self.save!
  end
end
