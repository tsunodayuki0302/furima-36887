class ShippingAddress
  include ActiveModel::Model
  attr_accessor :telephone_number, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :user_id, :item_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください"}
    validates :municipalities
    validates :address 
    validates :telephone_number, format:{with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end