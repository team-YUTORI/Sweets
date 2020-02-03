class Customers::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
  end

  def thanks
  end

  def about
  end
end
