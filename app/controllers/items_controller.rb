class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
   @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :item_status_id, :ship_charge_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
