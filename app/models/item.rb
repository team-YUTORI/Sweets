class Item < ApplicationRecord
  has_many :order_details
  belongs_to :genre

  mount_uploader :item_image_id, ItemImageIdUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :without_tax_price, presence: true
  validates :genre_id, presence: true
  validates :sale_status, presence: true

  enum sale_status: [:販売中, :売切れ]
end
