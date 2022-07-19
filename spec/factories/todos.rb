FactoryBot.define do
  factory :todo do
    title { Faker::Book.title }
    description { Faker::Quote.yoda }
    completed { false }
    date { "2022-07-04 22:13:06" }
  end
end
