class Location < ApplicationRecord
  has_many :vehicles
  validates :name,  presence: true
  validates :latitude,  presence: true
  validates :longitude,  presence: true
end
