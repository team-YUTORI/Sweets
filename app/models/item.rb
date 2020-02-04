class Item < ApplicationRecord

  has_many :order_details
  has_many :cart_items
  belongs_to :genre

  # belongs_to :home

  attachment :item_image
  # mount_uploader :item_image_id, ItemImageIdUploader

  validates :item_image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :without_tax_price, presence: true
  validates :genre_id, presence: true
  enum sale_status: [:販売中, :売切れ]

end
