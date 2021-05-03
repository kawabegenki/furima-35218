FactoryBot.define do
  factory :history_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_cord { '123-4567' }
    pay_from { 2 }
    city { '札幌市' }
    addresses { 'ああああああ' }
    building { '東京ハイツ' }
    phone_number { '09011112222' }
  end
end
