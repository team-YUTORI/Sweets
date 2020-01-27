class Customers::DeliveryAddressesController < ApplicationController

  def index
    @delivery = DeliveryAddress.new
    @deliverys = DeliveryAddress.all
  end

  def create
    @delivery = DeliveryAddress.new(delivery_address_params)

    if @delivery.save
       redirect_to delivery_addresses_path
       flash[:notice] = "配送先が登録されました"
    else
      @deliverys = DeliveryAddress.all
      render :index
    end

  end

  def destroy
    delivery = DeliveryAddress.find(params[:id])
    delivery.destroy
    redirect_to delivery_addresses_path
  end

  def edit
  end

  def update
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
