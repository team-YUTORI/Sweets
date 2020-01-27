class Admins::OrdersController < ApplicationController
def top
  @order = Order.count
end

def index
  @orders = Order.all
end

def show
  @order = Order(params[:id])
end



end
