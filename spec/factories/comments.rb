FactoryBot.define do
  factory :comment do
    name { "MyString" }
    content { "MyText" }
    post { nil }
  end
end
