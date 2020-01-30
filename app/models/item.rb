class Item < ApplicationRecord

  belongs_to :genre
  # belongs_to :home

  has_many :cart_items

  mount_uploader :item_image_id, ItemImageIdUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :without_tax_price, presence: true
  # validates :genre_id, presence: true
  validates :sale_status, presence: true

  enum sale_status: [:販売中, :売切れ]
end
