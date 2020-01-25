module Admins::ItemsHelper

  def without_tax_price(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end

  def tax(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
