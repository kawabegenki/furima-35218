FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'秋山'}
    last_name             {'玄樹'}
    first_read            {'アキヤマ'}
    last_read             {'ゲンキ'}
    birthday              {'1992/10/07'} 
  end
end