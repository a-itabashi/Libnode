class Place < ApplicationRecord
  DEFAULT_NUMBER_OF_DIGITS = 2.freeze

  validates :shelf, :column, :row, presence: true, length: { maximum: DEFAULT_NUMBER_OF_DIGITS }
end
