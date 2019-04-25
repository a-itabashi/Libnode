FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'teat@example.com' }
    uid { 123_456_789 }
    image { 'https://i.gyazo.com/42cf81c98e83d58e52e924b00c9decc8.png' }
    admin { false }
  end
end
