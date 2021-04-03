FactoryBot.define do
  factory :order do
    total { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    user_id { Faker::Number.unique.number(digits: 10) }
    status { :initial }


    after :create do |order, evaluator|
      2.times do
        order.items.create(
          book_id: Faker::Number.number(digits: 4),
          subtotal: order.total / 2,
          quantity: 1
        )
      end
    end
  end
end
