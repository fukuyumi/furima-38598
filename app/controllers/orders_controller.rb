class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  
  def index
  end

  def new
    @order_address = OederAddress.new
  end

  def create
    @order_address = OederAddress.new(order_params)
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path(@order_address)
    else
      render :new
    end
  end

 private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :buliding, :phone_number).marge(user_id: current_user.id)
  end
end
