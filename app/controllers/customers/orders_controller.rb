class Customers::OrdersController < ApplicationController

def index
  @order = order_details.id
end

def new
  @order = Order.create

end

def show
  注文情報
  注文内容
  請求金額

end

end
