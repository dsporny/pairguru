FactoryBot.define do
  factory :comment do
    username { "MyString" }
    body { "MyText" }
    movie { nil }
    user { nil }
  end
end
