class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
def top
  @orders = Order.all
  @order= Order.new
end

def update
  @order = Order.find(params[:id])
  if
  @order.update(order_params)
  redirect_to admins_order_path, notice:"You have updated order successfully."
  else
  render :show
end
end

def index
  @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end



end
