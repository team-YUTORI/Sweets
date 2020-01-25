class Customers::ItemsController < ApplicationController

  def index

   @genres = Genre.all   # ジャンルの全ての情報を代入

   if params[:genre_id]   # urlにgenre_id(params)がある場合

     @genre = Genre.find(params[:genre_id])   # Genreのデータベースのテーブルから一致するidを取得

     @items = @genre.items.order(created_at: :desc).all   # genre_idと紐づく投稿を取得

   else

     @items = Item.order(created_at: :desc).all   # 投稿すべてを所得
     @

   end

     @item = Item.page(params[:page]).per(8)   #1ページに8個のデータだけを、新しい順に取得するように変更
     # @counts = Item.group(:name).count(:name)
     # @genre = Genre.find(params[:genre_id])
  end


  def show
      @genres = Genre.all
      @item = Item.find(params[:item_id])   # 選択されたitem_idの情報を代入
      tax = @item.without_tax_price * 1.1   # 税込み価格

    if params[:genre_id]

      @genre = Genre.find(params[:genre_id])

      @items = @genre.items.order(created_at: :desc).all

    else

      @items = Item.order(created_at: :desc).all

    end
  end


  def create
    item_number = Item_number.new   #商品個数を保存
    if orders_details.save   # 商品個数を注文詳細に保存
      redirect_to crats_items_path(customer_id)   # 保存したらカートに移動
    end

end
