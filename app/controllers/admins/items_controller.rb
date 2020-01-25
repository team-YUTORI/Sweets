class Admins::ItemsController < ApplicationController

  def index
  end

  def show
    item = Item.find(params[:id])
    genre = Genre.find(params[:id])
    tax = item.without_tax_price * 1.1   # 税抜価格を所得し、税率10%をかけた
  end

  def new
    @item = Item.new
    @items = Item.find(prams[:id])
    if @items.user != admin_user
      redirect_to items_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(item.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :without_tax_price, :sale_status)
  end
end
