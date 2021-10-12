require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @shipping_address = FactoryBot.build(:shipping_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  context '内容に問題ない場合' do
    it "postal_code、prefecture_id、municipalities、address、shipping_address、telephone_number、tokenがあれば保存ができること" do
      expect(@shipping_address).to be_valid
    end
    it "building_nameが空でも登録できる" do
      @shipping_address.building_name = ''
      expect(@shipping_address).to be_valid
    end
  end

  context '内容に問題ある場合' do
    it "郵便番号が空だと登録できない" do
      @shipping_address.postal_code = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
    end
    it "都道府県が空だと登録できない" do
      @shipping_address.prefecture_id = 1
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("都道府県を入力してください")
    end
    it "市区町村が空だと登録できない" do
      @shipping_address.municipalities = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it "番地が空だと登録できない" do
      @shipping_address.address = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("番地を入力してください")
    end
    it "電話番号が空だと登録できない" do
      @shipping_address.telephone_number = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
    end
    it "tokenが空では登録できないこと" do
      @shipping_address.token = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it "郵便番号にハイフンがないと登録できない" do
      @shipping_address.postal_code = '1234567'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("郵便番号は不正な値です")
    end
    it "電話番号が半角数値以外だと登録できないこと" do
      @shipping_address.telephone_number = 'あa'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("電話番号は不正な値です")
    end
    it "電話番号が10桁未満だと登録できないこと" do
      @shipping_address.telephone_number = '123456789'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("電話番号は不正な値です")
    end
    it "電話番号が12桁以上だと登録できないこと" do
      @shipping_address.telephone_number = '123456789123'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("電話番号は不正な値です")
    end
    it "購入者が紐付いていなければ購入できない" do
      @shipping_address.user_id = ''
      @shipping_address.valid?
      binding.pry
      expect(@shipping_address.errors.full_messages).to include("Userを入力してください")
    end
    it "出品物が紐付いていなければ購入できない" do
      @shipping_address.item_id = ''
      @shipping_address.valid?
      binding.pry
      expect(@shipping_address.errors.full_messages).to include("Itemを入力してください")
    end
  end
end