class Customers::UsersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_user,{only: [:show,:edit,:update, :destroy, :withdraw_top]}

  def show
    @user = Customer.find(params[:id])
  end

  def edit
    @user = Customer.find(params[:id])
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update(customer_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    user = Customer.find(params[:id])
    user.destroy
    redirect_to new_customer_registration_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :phone_number, :email, :deleated_at)
  end

  def withdraw_top
    @user = Customer.find(params[:id])
  end

  def ensure_correct_user
    @user = Customer.find_by(id: params[:id])
    if @user.id != current_customer.id
    redirect_to new_customer_session_path
    end
  end

end
