class Place < ApplicationRecord
  DEFAULT_NUMBER_OF_DIGITS = 2

  has_many :book_places, dependent: :destroy
  has_many :books, through: :book_places

  validates :shelf, :column, :row, presence: true, length: { maximum: DEFAULT_NUMBER_OF_DIGITS }
  # validate :place_must_greater_than_0

  # def place_must_greater_than_0
  #   errors.add(:error, '場所情報は1以上の整数を入力して下さい') if shelf <= 0 || column <= 0 || row <= 0
  # end
end
