class Customers::CartItemsController < ApplicationController


  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save!
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_number, :item_id)
  end

end
