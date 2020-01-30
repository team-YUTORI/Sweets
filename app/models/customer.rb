class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # last_nameの空欄、文字制限（１５文字）
  validates :last_name, presence: true, length: {maximum: 15 }
  #first_nameの空欄、文字制限（１５文字）
  validates :first_name, presence: true, length: {maximum: 15 }
  #last_kanaの空欄、文字制限（１５文字）
  validates :last_kana, presence: true, length: {maximum: 15 }
  #first_nameの空欄、文字制限（１５文字）
  validates :first_name, presence: true, length: {maximum: 15 }
  #postal_codeの空欄、文字制限（"-"禁止）
  validates :postal_code, presence: true, exclusion: { in: ["-"] }
  #addressの空欄
  validates :address , presence: true
  #phone_numberの空欄、文字制限（"-"禁止）
  validates :phone_number, presence: true, exclusion: { in: ["-"] }
  #論理削除(paranoia)を使うための記述
  acts_as_paranoid
end
