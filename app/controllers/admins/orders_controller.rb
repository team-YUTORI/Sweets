class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
def top
  @orders = Order.all
  @order= Order.new
end

def index
  @orders = Order.all
  @order_details=OrderDetail.all
end

def show
  @order = Order.find(params[:id])
  @orderdetail = @order.order_details
end

def update
  @order = Order.find(params[:id])
  if
  @order.update(order_params)
  # else
  # @orderdetail.update(detail_params)
  end
  redirect_to admins_orders_path
end

def productionupdate
  @orderdetail = OrderDetail.find(params[:id])
  @orderdetail.production_status = params[:production_status]
  @orderdetail.update(order_details_params)
  redirect_to admins_orders_path
end


private

def order_params
   params.require(:order).permit(:order_status)
end
def order_details_params
  params.require(:order_detail).permit(:production_status)
end

end
