FactoryBot.define do
  factory :shipping_address do
    postal_code         { "123-4567" }
    prefecture_id       { 2 }
    municipalities      { "あ" }
    address             { "あ" }
    building_name       { "あ" }
    telephone_number    { "1234567890" }
    token      {"tok_7e6c4ef3dfdb4fd0a54b000c659a"}
  end
end
