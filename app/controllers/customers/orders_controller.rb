class Customers::OrdersController < ApplicationController

  def new
    @order = Order.create
  end

  def index
    @order = order_details.id
  end

  def show
  end


end
