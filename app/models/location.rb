class Location < ApplicationRecord
  has_many :vehicles
  has_many :orders
  validates :name,  presence: true
  validates :latitude,  presence: true
  validates :longitude,  presence: true
end
