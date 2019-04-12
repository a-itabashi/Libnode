class Category < ApplicationRecord
  has_many :book_categories, dependent: :destroy

  validates :name, presence: true
end
