class Admins::ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
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
