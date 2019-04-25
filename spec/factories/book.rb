FactoryBot.define do
  factory :book do
    title { 'テストタイトル' }
    author { 'テスト著者' }
    saled_at { 2019 / 5 / 1 }
    price { 5_000 }
    description { 'テスト説明' }
    image { 'https://i.gyazo.com/42cf81c98e83d58e52e924b00c9decc8.png' }
  end
end
