class Place < ApplicationRecord
  DEFAULT_NUMBER_OF_DIGITS = 2.freeze

  has_many :book_places, dependent: :destroy
  has_many :books, through: :book_places

  validates :shelf, :column, :row, presence: true, length: { maximum: DEFAULT_NUMBER_OF_DIGITS }
end
