require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品が出品できる場合' do
      it "product_name、product_description、category_id、product_condition_id、shipping_charge_id、prefecture_id、days_to_ship_id、selling_priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it "product_nameが空だと登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "product_descriptionが空だと登録できない" do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "product_condition_idが1だと登録できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "shipping_charge_idが1だと登録できない" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "days_to_ship_idが1だと登録できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "selling_priceが空だと登録できない" do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it "selling_priceが300円未満だと登録できない" do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is invalid")
      end
      it "selling_priceが9,999,999を超えると登録できない" do
        @item.selling_price = 10000000
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Selling price is invalid")
      end
    end
  end
end