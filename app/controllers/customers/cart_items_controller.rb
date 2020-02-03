class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    # @orders = Order.new
  end

  def create
    #現在ログイン中のユーザーと、そのカートアイテムの空のインスタンスを生成
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
