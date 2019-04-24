FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "teat@example.com" }
    image { "https://i.gyazo.com/42cf81c98e83d58e52e924b00c9decc8.png"}
    admin { false }
  end
end
