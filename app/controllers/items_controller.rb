class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.order("created_at DESC")
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

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

end
