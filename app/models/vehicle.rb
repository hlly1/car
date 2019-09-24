class Vehicle < ApplicationRecord
  has_many :orders
  validates :name,  presence: true
  validates :detail,  presence: true
  validates :price,  presence: true
  validates :location, presence: true
  
end
