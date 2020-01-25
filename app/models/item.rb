class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :without_tax_price, presence: true
  validates :genre_id, presence: true
  validates :sale_status, presence: true
end
