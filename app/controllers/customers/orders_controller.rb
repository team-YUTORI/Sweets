class Customers::OrdersController < ApplicationController

def index
  @orders = Order.all
end

def new
  # カート内容を取得
  @cart_items = CartItem.find(params[:id])
  @cart_item = @cart_items.each
  # 支払い方法を取得

  if 0なら0の内容
  else 1なら選択された1表示
  elsif 2なら2
  end
end

  def create
    if @Order.save
    else 2ならdelivery_addressにセーブ
    end
  end

def show
  @orders = Order.all
  @order = Order.find(params[:id])
end




end
