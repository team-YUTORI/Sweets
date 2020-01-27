class Admins::ItemsController < ApplicationController

  def index
    @item = Item.page(params[:page]).per(10)
    @items = Item.all
    # @genre = Genre.find(params[:id])
  end

  def show
    @items = Item.find(params[:id])
    genre = Genre.find(params[:id])
    tax = item.without_tax_price * 1.1   # 税抜価格を所得し、税率10%をかけた
  end

  def new
    @item = Item.new
    # @items = Item.find(params[:id])
    # if @items.user != admin_user
      # redirect_to root_path
    # end
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
    @items = Item.find(params[:id])
    # if @items.user != admin_user
    #   redirect_to root_path
    # end
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :without_tax_price, :sale_status)
  end

  def genre_params
    prams.require(:genre).permit(:name, :genre_id)
  end

end
