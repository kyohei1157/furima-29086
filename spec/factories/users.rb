FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)+"1a"}
    password_confirmation {password}
    surname {'田中'}
    name {'弘史'}
    surname_furigana {'タナカ'}
    name_furigana {'ヒロシ'}
    birthday {'2020-01-01'}
  end
end