class Category < ApplicationRecord
  has_many :book_categories, dependent: :destroy
  has_many :books, through: :book_categories

  validates :name, presence: true

  private

  class << self
    def how_many_contains(target, search_words)
      search_words.map do |word|
        target.count(word)
      end
    end
  end
end
