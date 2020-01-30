class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #last_nameの空欄、文字制限（１５文字）
  validates :last_name, presence: true, length: {maximum: 15 }
  #first_nameの空欄、文字制限（１５文字）
  validates :first_name, presence: true, length: {maximum: 15 }
  #last_kanaの空欄、文字制限（１５文字）
  validates :last_kana, presence: true, length: {maximum: 15 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  #first_nameの空欄、文字制限（１５文字）
  validates :first_kana, presence: true, length: {maximum: 15 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  #postal_codeの空欄、3桁-4桁以外禁止
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
  #addressの空欄
  validates :address , presence: true
  #phone_numberの空欄、文字制限（"-"禁止）
  validates :phone_number, presence: true, format: { with: /\A\d{3}[-]\d{4}[-]\d{4}\z/ }
  #論理削除(paranoia)を使うための記述
  acts_as_paranoid

  has_many :cart_items
end
