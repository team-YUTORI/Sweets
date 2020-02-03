class Order < ApplicationRecord
  has_many :order_details

  enum payment: [:クレジットカード, :銀行振込]

end
