class DeliveryAddress < ApplicationRecord
  # 郵便番号バリデーション（空白、文字制限）
  validates :postal_code, presence: true, length: { maximum: 7 }
  # 住所バリデーション （空白）
  validates :address, presence: true
  # 宛名バリデーション （空白）
  validates :name, presence: true
  
end
