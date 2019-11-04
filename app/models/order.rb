class Order < ApplicationRecord
  belongs_to :location
  belongs_to :user
  belongs_to :vehicle
  extend Geocoder::Model::ActiveRecord
  validates :start, :user_id, :vehicle_id, :end, :location_id, presence: true
  after_create :set_price
  validate :date_validation
  
  def paypal_url(return_path)
    puts "----------development-----------#{Rails.env.development?}------------------------"
    puts "--------------production-------#{Rails.env.production?}------------------------"
    if Rails.env.development?
      values = {
          business: "dataerror0-facilitator@gmail.com",
          cmd: "_xclick",
          upload: 1,
          return: "https://c2454f80df8645668fcd790fdc87b9b3.vfs.cloud9.us-east-2.amazonaws.com/#{return_path}?status=ok",
          invoice: self.id+Time.now.to_i,
          currency: "AUD",
          amount: self.price,
          item_name: "payment",
          item_number: self.id+Time.now.to_i,
          quantity: '1'
      }
    end
    
    if Rails.env.production?
      values = {
          business: "dataerror0-facilitator@gmail.com",
          cmd: "_xclick",
          upload: 1,
          return: "https://pp1-mocar.herokuapp.com/#{return_path}?status=ok",
          invoice: self.id+Time.now.to_i,
          amount: self.price,
          currency: "AUD",
          item_name: "payment",
          item_number: self.id+Time.now.to_i,
          quantity: '1'
      }
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
  
  def set_price
    self.price = (self.end-self.start)/3600 * self.vehicle.price
    self.save!
  end

  def date_validation
    if (self.end-self.start)/3600 < 1
      errors.add(:start, "The minimum rental period is  60 mins!")
      return "The minimum rental period is  60 mins!"
    end

    if self.start < Time.now
      errors.add(:start, "Start and end date/time must be now and future!")
      return "Start and end date/time must be now and future!"
    end

    if self.end < Time.now
      errors.add(:start, "End date/time must be later than Start date/time!")
      return "End date/time must be later than Start date/time!"
    end
  end
  
  def location_validation(ip)
    if Location.distance(Geocoder.search(ip), Geocoder.search(self.location.address)) > 1
      errors.add("Return Failed: You are now too far from vehicle return location!")
    end
  end

end
