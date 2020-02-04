class Customers::HomesController < ApplicationController
  def top
    @genres = Genre.where(on_display: true)
    @items = Item.where(genre: @genres, sale_status: 0)
  end

  def thanks
  end

  def about
  end
end
