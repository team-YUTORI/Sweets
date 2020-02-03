class Customers::OrdersController < ApplicationController


  # before_action :authenticate_customer!

	# before_action :screen_user,only: [:new, :index , :create , :show,]

def index
  @orders = Order.all
end

def new
  @cart_items = CartItem.where(customer_id: current_customer.id)
  @order = Order.new
  @order_detail = OrderDetail.new
  @order.payment = params[:payment].to_i
  @order.address = params[:address].to_i
  @postage= 800
  @payment = @order.payment
  @without_tax_price = @order_detail.without_tax_price
  @item_number = @order_detail.item_number
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
  order = Order.new(
    customer_id: current_customer.id,
    order_status: 0,
    name: params[:order][:name],
    postal_code: params[:order][:postal_code],
    address: params[:order][:address],
    payment: params[:order][:payment].to_i,
  )
  if order.save
    current_customer.cart_items.each do |cart_item|
      OrderDetail.create(
      order_id: order.id,
      item_id: cart_item.item.id,
      item_number: cart_item.item_number,
      without_tax_price: cart_item.item.without_tax_price
      )
      cart_item.destroy
    end
    if params[:order][:is_new_address] == "true"
      DeliveryAddress.create(customer_id: current_customer.id, name: params[:order][:name], postal_code: params[:order][:postal_code], address: params[:order][:address])
    end
    redirect_to thanks_path and return
  end
  render :new and return
end

def show
  # @orders = Order.all
  # @order = Order.find(params[:id])
  # @postage = Order.postage
end

private

# def order_params
#   params.require(:order).permit(:without_tax_price)
# end

#
# def order_detail_params
#   params.require(:order_detail).permit(:item_number)
# end

def integer_string?(str)
   Integer(str)
   true
 rescue ArgumentError
   false
end

# def screen_user
#   cart_items = CartItem.find(params[:id])
#   if cart_items.user.id != current_user.id
#     redirect_to _path
#   end
# end


end
