FactoryBot.define do
  factory :user do
    username { "Nicole" }
    email { "nicole@blog.com" }
    password { "password" }
  end

  factory :post do
    title { 'Blog Title' }
    content { 'This is a blog post' }
    trait :published do
      is_published { 1 }
    end
    trait :unpublished do
      is_published { 0 }
    end
  end
end
