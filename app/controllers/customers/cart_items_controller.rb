class Customers::CartItemsController < ApplicationController

def show
  @cart = Item.find(session[:cart_item])
end




private
  def cart_params
    params.require(:cart_item).permit(:item_number)
  end
end
