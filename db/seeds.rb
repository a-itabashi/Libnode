# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'

FactoryBot.define do
  factory :user do
    name { "勤勉なエンジニア" }
    email { "test@example.com"}
    uid { 123456789 }
    image { "test" }
  end

  factory :book do
    title { "本のタイトル" }
    author { "著名な著者" }
    saled_at { 2019/1/1 }
    price { 100000 }
    description { "教養が身につきます" }
    image { "https://i.gyazo.com/42cf81c98e83d58e52e924b00c9decc8.png" }
  end

  factory :category do
    name { "カテゴリA" }
  end

  factory :book_category do
    category { 1 }
    book { 1 }
  end

  factory :place do
    shelf { 11 }
    column { 22 }
    row { 33 }
  end

  factory :book_place do
    place { 1 }
    book { 1 }
  end
end

user_a = FactoryBot.create(:user)
category_a = FactoryBot.create(:category)
category_b = FactoryBot.create(:category, name: "カテゴリB")
place_a = FactoryBot.create(:place)

titles = [
  "プロを目指す人のためのRuby入門",
  "現場で使える Ruby on Rails 5速習実践ガイド",
  "マスタリングTCP／IP（入門編）第5版",
  "Vue．js入門",
  "基礎から学ぶVue．js",
  "SQL 第2版 ゼロからはじめるデータベース操作",
  "わかばちゃんと学ぶGit使い方入門",
  "オブジェクト指向設計実践ガイド",
  "Python機械学習プログラミング第2版",
  "アルゴリズム図鑑 絵で見てわかる26のアルゴリズム"
]

images = [
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3977/9784774193977.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2227/9784839962227.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8768/9784274068768.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0919/9784297100919.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2457/9784863542457.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4450/9784798144450.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2174/9784863542174.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3619/9784774183619.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3373/9784295003373.jpg?_ex=200x200",
  "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9776/9784798149776.jpg?_ex=200x200"
]
10.times do |n|
  book_a = FactoryBot.create(:book, title: titles[n], image: images[n])
  FactoryBot.create(:book_category, book: book_a, category: category_a)
  FactoryBot.create(:book_category, book: book_a, category: category_b)
  FactoryBot.create(:book_place, book: book_a, place: place_a)
end
