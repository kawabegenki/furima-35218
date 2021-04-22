FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    first_name            {'秋山'}
    last_name             {'玄樹'}
    first_read            {'アキヤマ'}
    last_read             {'ゲンキ'}
    birthday              {'1992/10/07'} 
  end
end