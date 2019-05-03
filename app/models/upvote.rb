class Upvote < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }

  scope :resentry_3_user, -> { order(created_at: :desc).limit(3).pluck(:user_id) }
end
