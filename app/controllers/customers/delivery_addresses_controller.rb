class Customers::DeliveryAddressesController < ApplicationController
before_action :authenticate_customer!

  def index
    @delivery = DeliveryAddress.new
    @deliverys = DeliveryAddress.where(customer_id: current_customer)
  end

  def new
    @order = Order.new
    @delivery_addresses = DeliveryAddress.where(customer_id: current_customer)
  end

  def create
    @delivery = DeliveryAddress.new(delivery_address_params)
    @delivery.customer_id = current_customer.id
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

  def destroy
    delivery = DeliveryAddress.find(params[:id])
    delivery.destroy
    redirect_to delivery_addresses_path
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :address, :name, :customer_id)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end

end
