class DeliveryAddress < ApplicationRecord

  belongs_to :customer
  # 郵便番号バリデーション（空白、文字制限）
  validates :postal_code, presence: true, length: { maximum: 7 }
  # 住所バリデーション （空白）
  validates :address, presence: true
  # 宛名バリデーション （空白）
  validates :name, presence: true

  # 郵便番号と住所と名前を一緒に記述
  def view_code
    self.postal_code + self.address + self.name
  end

end
