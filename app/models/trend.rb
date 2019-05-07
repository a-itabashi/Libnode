class Trend < ApplicationRecord
  scope :top_20, -> { order(created_at: :desc).limit(20).reverse }
end
