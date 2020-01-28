class Customers::DeliveryAddressesController < ApplicationController

  def index
    @delivery = DeliveryAddress.new
    @deliverys = DeliveryAddress.all
  end

  def create
    @delivery = DeliveryAddress.new(delivery_address_params)

    if @delivery.save
       flash[:notice] = "配送先が登録されました"
       redirect_to delivery_addresses_path
    else
      @deliverys = DeliveryAddress.all
      render :index
    end

  end

  def edit
    @delivery = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery = DeliveryAddress.find(params[:id])

    if @delivery.update(delivery_address_params)
       flash[:notice] = "配送先が変更されました"
       redirect_to delivery_addresses_path
    else
       render :edit
    end

  end

  def new
    @delivery = DeliveryAddress.new
  end

  def destroy
    delivery = DeliveryAddress.find(params[:id])
    delivery.destroy
    redirect_to delivery_addresses_path
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
