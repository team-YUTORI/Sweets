class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    # @orders = Order.new
  end

  def create
    cart_items = CartItem.where(customer_id: current_customer)
    has_item = false
    cart_items.each do | cart_item |
      if cart_item.item_id == params[:cart_item][:item_id].to_i
          has_item = true
        # 数量をupdate
          sum = cart_item.item_number + params[:cart_item][:item_number].to_i
          cart_item.update(item_number: sum)
      end
    end

    if !has_item
      cart_item = current_customer.cart_items.new(cart_item_params)
      cart_item.save!
    end
    @cart_items = CartItem.where(customer_id: current_customer)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy!
    redirect_to cart_items_path
  end

  def all_destroy
    #現在ログイン中のユーザーと、そのカートアイテム情報を代入
    cart_items = current_customer.cart_items
    #カート内の全ての情報の削除
    cart_items.destroy_all
    redirect_to items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_number, :item_id)
  end

end
