class Space < ApplicationRecord
  enum status: {blocked: 0, approved: 1}
  belongs_to :venue
  belongs_to :type
  belongs_to :user
  has_one :price
  accepts_nested_attributes_for :price, reject_if: :all_blank
  mount_uploader :picture, PictureUploader
  validates :name, :capacity, :hour_open, :hour_close, :picture,
            presence: true
end
