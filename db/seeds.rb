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
    name { "勤勉なエンジニアA" }
  end

  factory :portfolio do
    explanation { "xxx" }
  end

  factory :comment do
    content { "Awesome!" }
  end

  factory :correction do
    sentence { "Not Good" }
  end
end

user_a = FactoryBot.create(:user)
portfolio_a = FactoryBot.create(:portfolio, user: user_a)

3.times do |n|
  FactoryBot.create(:comment, content: "content#{n}", user: user_a, portfolio: portfolio_a)
  FactoryBot.create(:correction, sentence: "content#{n}", user: user_a, portfolio: portfolio_a)
end
