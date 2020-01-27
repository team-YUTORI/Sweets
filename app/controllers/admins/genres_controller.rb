# frozen_string_literal: true
class Admins::GenresController < ApplicationController
  def create
    @genre = Genre.new(admin_genre_params)
    if @genre.save
    redirect_to admins_genres_path, notice:"You have creatad genre successfully."
    else
    @genres = Genre.all
    render :index
  end
 end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

 def on_display(genre)
   if genre.on_display
     有効
   else
     無効
   end
 end


  def edit
   end

  def destroy; end

private
def admin_genre_params
    params.require(:genre).permit(:name, :on_display)
end
end
