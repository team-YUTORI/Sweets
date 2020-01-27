class DeliveryAddress < ApplicationRecord
  # 郵便番号バリデーション（空白、文字制限）
  validates :postal_code, presence: true, length: { maximum: 7 }
end
