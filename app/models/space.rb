class Space < ApplicationRecord
  belongs_to :venue
  belongs_to :type
  belongs_to :user
  has_one :price
  accepts_nested_attributes_for :price, reject_if: :all_blank
  mount_uploader :picture, PictureUploader
end
