FactoryBot.define do
  factory :user do
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.safe_email(name: name) }
    surname { Faker::Name.last_name }
    name { Faker::Name.first_name }
    cpf { CPF.generate }
  end
end
