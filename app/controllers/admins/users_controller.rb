class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = Customer.page(params[:page]).per(10)
    @users = Customer.with_deleted #論理削除されているユーザーと、既存ユーザーの両方を表示
  end

  def show
    @user = Customer.with_deleted.find(params[:id])#論理削除されているユーザーと、既存ユーザーの両方をIDを取得
  end

  def edit
    @user = Customer.with_deleted.find(params[:id])
    
  end

  def update
    @user = Customer.with_deleted.find(params[:id])
    if @user.update(customer_params)
    redirect_to admins_users_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :phone_number, :email, :deleted_at)
  end

end
