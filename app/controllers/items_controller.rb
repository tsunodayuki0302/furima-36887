class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [ :edit, :update, :show, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
    if current_user.id != @item.user_id or @item.purchase_record != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
