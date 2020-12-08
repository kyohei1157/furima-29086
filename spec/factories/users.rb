FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname {Faker::
    name {Faker::
    surname_furigana {Faker::
    name_furigana {Faker::
    birthday {Faker::
  end
end