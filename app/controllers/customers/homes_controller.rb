class Customers::HomesController < ApplicationController
  def top
    @items = Item.all
  end

  def thanks
  end

  def about
  end
end
