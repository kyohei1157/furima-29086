FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname {Faker::Name.last_name}
    name {Faker::Name.last_name}
    surname_furigana {Faker::Name.last_name}
    name_furigana {Faker::Name.last_name}
    birthday {Faker::Name.last_name}
  end
end