FactoryBot.define do
  factory :user_address do
    street { "MyString" }
    number { 1 }
    city { "MyString" }
    state { "MyString" }
    user
  end
end
