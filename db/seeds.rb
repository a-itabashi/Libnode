# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'factory_bot_rails'

FactoryBot.define do
  factory :place do
    shelf { 11 }
    column { 22 }
    row { 33 }
  end
end

user_a = FactoryBot.create(:user)
category_a = FactoryBot.create(:category, name: "カテゴリA")
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
  "アルゴリズム図鑑 絵で見てわかる26のアルゴリズム",
  "ゼロから作るDeep Learning",
  "リーダブルコード",
  "エリック・エヴァンスのドメイン駆動設計",
  "プログラミングコンテストチャレンジブック第2版",
  "合格対策 AWS認定ソリューションアーキテクト - アソシエイト",
  "実践ドメイン駆動設計",
  "SQLアンチパターン",
  "マイクロサービスアーキテクチャ",
  "Web　API：The　Good　Parts",
  "Amazon Web Services 基礎からのネットワーク＆サーバー構築　改訂版",
  "現場で役立つシステム設計の原則",
  "Webを支える技術"
]

22.times do |n|
  # S3へアップロードが必要な時に使用
  # book_a = FactoryBot.create(:book, title: titles[n], image: File.open("./public/uploads/tmp/#{n+1}.jpg"))

  book_a = FactoryBot.create(:book, title: titles[n], image: "https://s3-ap-northeast-1.amazonaws.com/libnode-development/uploads/book/image/#{n + 1}/#{n + 1}.jpg")
  if n < 12
    FactoryBot.create(:book_category, book: book_a, category: category_a)
  else
    FactoryBot.create(:book_category, book: book_a, category: category_b)
  end
  FactoryBot.create(:book_place, book: book_a, place: place_a)
end
