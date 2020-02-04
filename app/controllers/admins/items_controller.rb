class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.where(on_display: true)
    @item = Item.where(genre: @genres).page(params[:page]).per(10)
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    @tax = @item.without_tax_price * 1.1   # 税抜価格を所得し、税率10%をかけた
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end

  def new
    @item = Item.new
    @genres = Genre.where(on_display: true)   #whereで持ってくる情報を厳選
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.where(on_display: true)
    if @item.save
      redirect_to admins_item_path(@item.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.where(on_display: true)
    if admin_signed_in?
    else
      redirect_to root_path
    end
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to admins_item_path
    else
      render :edit
    end
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy!
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :without_tax_price, :sale_status, :item_image)
  end
  # def genre_params
  #   prams.require(:genre).permit(:name, :on_display)
  # end

end
