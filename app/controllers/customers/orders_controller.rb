class Customers::OrdersController < ApplicationController

def index
  @orders = Order.all
end

def new
    sum = 0
    current_customer.cart_items.each do |cart_item|
    sum += cart_item.item.without_tax_price * cart_item.item_number * 1.1
  end
  @cart_items = CartItem.where(customer_id: current_customer.id)
  @order = Order.new
  @order_detail = OrderDetail.new
  @order.payment = params[:payment].to_i
  @order.address = params[:address].to_i
  @postage= 800
  @payment = params[:payment].to_i
  @without_tax_price = @order_detail.without_tax_price
  @item_number = @order_detail.item_number
  @is_new_address = false
  @price = sum
  if params[:address].to_i == 0
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @name = current_customer.last_name +  current_customer.first_name
  elsif params[:address].to_i == 1
    delivery_address = DeliveryAddress.find(params[:delivery_address_id].to_i)
    @postal_code = delivery_address.postal_code
    @address = delivery_address.address
    @name = delivery_address.name
  elsif params[:address].to_i == 2 && params[:new_postal_code] =~ /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ && params[:new_address].present? && params[:new_name].present?
    @postal_code = params[:new_postal_code]
    @address = params[:new_address]
    @name = params[:new_name]
    @is_new_address = true
  else
    redirect_to new_address_path(current_customer.id)
  end
end

def create

    sum = 0
    current_customer.cart_items.each do |cart_item|
    sum += cart_item.item.without_tax_price * cart_item.item_number * 1.1
  end

  order = Order.new(
    customer_id: current_customer.id,
    order_status: 0,
    name: params[:order][:name],
    postal_code: params[:order][:postal_code],
    address: params[:order][:address],
    payment: params[:order][:payment].to_i,
    price: sum
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
      DeliveryAddress.create(
      customer_id: current_customer.id,
      name: params[:order][:name],
      postal_code: params[:order][:postal_code],
      address: params[:order][:address]
      )
    end

    redirect_to thanks_path and return

  end

  render :new and return

end

def show
  @orders = Order.all
  @order = Order.find(params[:id])
  @postage = Order.where(postage: 800)
end

private

def integer_string?(str)
   Integer(str)
   true
 rescue ArgumentError
   false
end
end
