class Customers::OrdersController < ApplicationController


  # before_action :authenticate_customer!

	# before_action :screen_user,only: [:new, :index , :create , :show,]

def index
  @orders = Order.all
end

def new
  # カート内容を取得
  @cart_items = CartItem.where(customer_id: current_customer.id)
  @price = 800
  # 支払い方法を取得
  # if 0なら0の内容
  # else 1なら選択された1を表示
  # elsif 2なら2を表示
  # end
end

def create
  @order= Order.new(order_params)
  @order.save!
  redirect_to new_orders_path(current_user)
end

def show
  # @orders = Order.all
  # @order = Order.find(params[:id])
  # @postage = Order.postage
end

private

def order_params
    params.require(:order).permit(:order_status, :name, :postal_code, :address, :postage, :price, :payment, delivery_address_attributes:[:name, :postal_code, :address])
end

# def screen_user
#   cart_items = CartItem.find(params[:id])
#   if cart_items.user.id != current_user.id
#     redirect_to _path
#   end
# end


end
