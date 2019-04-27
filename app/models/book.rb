class Book < ApplicationRecord
  mount_uploader :image, BookImageUploader
  acts_as_taggable_on :categories

  has_many :book_places, dependent: :destroy
  has_many :places, through: :book_places

  has_many :upvotes, dependent: :destroy
  has_many :borrow_lists, dependent: :destroy

  validates :title, presence: true

  def upvoted_by(user)
    Upvote.find_by(book_id: id, user_id: user.id) unless user.nil?
  end
end
