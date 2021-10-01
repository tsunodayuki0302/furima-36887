FactoryBot.define do
  factory :item do
    product_name          { 'a' }
    product_description   { 'a' }
    category_id           { 2 }
    product_condition_id  { 2 }
    shipping_charge_id    { 2 }
    prefecture_id         { 2 }
    days_to_ship_id       { 2 }
    selling_price         { '111111' }
    association :user
  end
end
