class CartItem < ApplicationRecord

  # mount_uploader :image, ImageUploader
  belongs_to :customer
  belongs_to :item
  validates :item_number, presence: true
end
