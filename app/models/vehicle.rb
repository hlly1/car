class Vehicle < ApplicationRecord
  has_many :orders
  belongs_to :location
  validates :name,  presence: true
  validates :detail,  presence: true
  validates :price,  presence: true
  validates :location_id,  presence: true
end
