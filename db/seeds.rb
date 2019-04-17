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

  factory :category do
    category { 1 }
    book { 1 }
  end

  factory :place do
    shelf { 11 }
    column { 22 }
    row { 33 }
  end
end

user_a = FactoryBot.create(:user)
book_a = FactoryBot.create(:book)
category_a = FactoryBot.create(:category)
category_b = FactoryBot.create(:category, name: "カテゴリB")
place_a = FactoryBot.create(:place)

FactoryBot.create(:book_category, book: book_a, category: category_a)
FactoryBot.create(:book_category, book: book_a, category: category_b)
FactoryBot.create(:book_place, book: book_a, place: place_a)
