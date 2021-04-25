FactoryBot.define do
  factory :item do
    title         { Faker::Lorem.sentence }
    price         { '33333' }
    content       { 'asdfghjkl;qaqwsedrftgyhujiklp' }
    category_id   { '3' }
    state_id      { '3' }
    charge_id     { '3' }
    from_id       { '3' }
    move_id       { '2' }
    association :user
  end
end
