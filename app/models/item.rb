class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image, :product_name, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_charge_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :selling_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end

