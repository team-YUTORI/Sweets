class Customers::CartItemsController < ApplicationController


  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save!
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy!
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to items_path
  end

  def update
    cart_item = Cartitem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_number, :item_id)
  end

end
