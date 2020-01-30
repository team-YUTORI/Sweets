class Customers::HomesController < ApplicationController
  def top
    @items = Item.all
    # @item = Item.find(params[:id])
    # @tax = @items.without_tax_price * 1.1   # 税込み価格
  end

  def thanks
  end

  def about
  end
end
