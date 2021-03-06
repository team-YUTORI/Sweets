class Order < ApplicationRecord
  has_many :order_details
  accepts_nested_attributes_for :order_details
  belongs_to :customer

  enum order_status:{"入金待ち":0 , "入金確認":1 , "制作中":2,  "発送準備中":3 ,
  "発送済み":4}
  enum payment: {クレジットカード:0, 銀行振込:1}
  # enum address:{"ご自身の住所":0 , "登録済み住所から選択":1 ,"新しいお届け先":2}

end
