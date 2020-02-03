class Customers::OrdersController < ApplicationController


  # before_action :authenticate_customer!

	# before_action :screen_user,only: [:new, :index , :create , :show,]

def index
  @orders = Order.all
end

def new
  @cart_items = CartItem.where(customer_id: current_customer.id)
  @order = Order.new(order_params)
  @order.payment = params[:payment].to_i
  @order.address = params[:address].to_i
  @price = 800
  @is_new_address = false
  if params[:address].to_i == 0
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @name = current_customer.last_name +  current_customer.first_name
  elsif params[:address].to_i == 1
    delivery_address = DeliveryAddress.find(params[:delivery_address_id].to_i)
    @postal_code = delivery_address.postal_code
    @address = delivery_address.address
    @name = delivery_address.name
  elsif params[:address].to_i == 2
    @postal_code = params[:new_postal_code]
    @address = params[:new_address]
    @name = params[:new_name]
    @is_new_address = true
  end
end

def create
  @order = Order.new(order_params)
  @order.save!
  redirect_to new_orders_path(current_user)
end

def show
  @orders = Order.all
  @order = Order.find(params[:id])
  @postage = Order.where(postage: 800)
end

private

def order_params
    params.permit(:name, :postal_code, )
end


def integer_string?(str)
   Integer(str)
   true
 rescue ArgumentError
   false
end
end
