class OrdersController < ApplicationController

  def index

    @shipping_address = ShippingAddress.new
    item_params
  end

  def create
    @shipping_address = ShippingAddress.new(address_params)
    item_params
    pay_item
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to root_path(@shipping_address)
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:shipping_address).permit( :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
