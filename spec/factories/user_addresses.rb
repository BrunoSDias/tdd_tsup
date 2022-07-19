FactoryBot.define do
  factory :user_address do
    street { Faker::Address.street_name }
    number { rand(10 ** 2) }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    user
  end
end
