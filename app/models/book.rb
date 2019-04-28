class Book < ApplicationRecord
  before_save :find_or_create_on_categories
  mount_uploader :image, BookImageUploader

  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories

  has_many :book_places, dependent: :destroy
  has_many :places, through: :book_places

  has_many :upvotes, dependent: :destroy
  has_many :borrow_lists, dependent: :destroy

  validates :title, presence: true
  validate :check_book

  def upvoted_by(user)
    Upvote.find_by(book_id: id, user_id: user.id) unless user.nil?
  end

  def check_book
    errors.add(:error, 'タイトルを入力して下さい') if title.nil?
  end

  def find_or_create_on_categories
    category_arr = categories&.map do |category|
      category_arr = category.name.split(',')
      category_arr.map { |c| Category.find_or_initialize_by(name: c) }
    end
    self.categories = category_arr[0]
  end
end
