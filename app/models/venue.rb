class Venue < ApplicationRecord
  enum status: {blocked: 0, approved: 1}
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :amenities, dependent: :destroy
  has_many :spaces, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
  accepts_nested_attributes_for :amenities, :address, reject_if: proc{|attributes| attributes["name"].blank?}
end
