class Customers::ItemsController < ApplicationController

  def index
      @genres = Genre.where(on_display: true)   # ジャンルの全ての情報を代入
      @item_page = Item.page(params[:page]).per(8)   #1ページに8個のデータだけを、新しい順に取得するように変更

    if params[:id]   # urlにgenre_id(params)がある場合
      @genre = Genre.find(params[:id])   # Genreのデータベースのテーブルから一致するidを取得
      @items = @genre.items.order(created_at: :desc).all   # genre_idと紐づく投稿を取得
    else
      @items = Item.order(created_at: :desc).all   # 投稿すべてを所得
    end
  end


  def show
     @cart_item = CartItem.new   #商品個数を保存
      @genres = Genre.where(on_display: true)
      @item = Item.find(params[:id])   # 選択されたitem_idの情報を代入
      @tax = @item.without_tax_price * 1.1   # 税込み価格
  end

  private

  def item_params
      params.require(:item).permit(:name, :description, :genre_id, :without_tax_price, :sale_status, :item_image_id)
  end

  def genre_params
      prams.require(:genre).permit(:name, :genre_id)
  end

end
