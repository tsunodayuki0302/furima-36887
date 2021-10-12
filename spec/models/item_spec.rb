require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品が出品できる場合' do
      it "image、product_name、product_description、category_id、product_condition_id、shipping_charge_id、prefecture_id、days_to_ship_id、selling_priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "product_nameが空だと登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "product_descriptionが空だと登録できない" do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "product_condition_idが1だと登録できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "shipping_charge_idが1だと登録できない" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "days_to_ship_idが1だと登録できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "selling_priceが空だと登録できない" do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格を¥300〜9,999,999に訂正してください")
      end
      it "selling_priceが300円未満だと登録できない" do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を¥300〜9,999,999に訂正してください")
      end
      it "selling_priceが9,999,999を超えると登録できない" do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を¥300〜9,999,999に訂正してください")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.selling_price = '1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を¥300〜9,999,999に訂正してください")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end