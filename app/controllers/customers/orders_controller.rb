class Customers::OrdersController < ApplicationController

  before_action :authenticate_user!
	before_action :screen_user,only: [:new, :index , :create , :show,]

def index
  @orders = Order.all
end

def new
  # カート内容を取得
  @cart_items = CartItem.find(params[:id])
  # 支払い方法を取得
  # if 0なら0の内容
  # else 1なら選択された1を表示
  # elsif 2なら2を表示
  # end
end

def create
  if @Order.save
  # else 2ならDeliveryAddress.save
  end
end

def show
  @orders = Order.all
  @order = Order.find(params[:id])
  @postage = Order.postage
end

private

def order_params
    params.require(:order).permit(:, :body)
end

def screen_user
  cart_items = CartItem.find(params[:id])
  if cart_items.user.id != current_user.id
    redirect_to _path
  end
end


end
