class Customers::CartItemsController < ApplicationController

  def index
    cart_items = CartItem.all
  end
end
