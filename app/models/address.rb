class Address < ApplicationRecord
  belongs_to :venue
  geocoded_by :city
  validates :name, presence: true
  validates :city, presence: true
  after_validation :geocode
end
