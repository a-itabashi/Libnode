class Book < ApplicationRecord
  before_save :find_or_create_on_categories
  mount_uploader :image, BookImageUploader

  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories

  has_many :book_places, dependent: :destroy
  has_many :places, through: :book_places

  has_many :upvotes, dependent: :destroy
  has_many :borrow_lists, dependent: :destroy

  validates :title, presence: true, presence: { message: 'は必ず入力してください' }
  validates :price, numericality: { greater_than_or_equal_to: 0 }, unless: proc { |a| a.price.blank? }

  scope :top_5_upvotes, -> { find(Upvote.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id)) }
  scope :top_5_borrowed, -> { find(BorrowList.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id)) }

  private

  def upvoted_by(user)
    Upvote.find_by(book_id: id, user_id: user.id) unless user.nil?
  end

  def find_or_create_on_categories
    if categories.present?
      category_arr = categories&.map do |category|
        category_arr = category.name.split(',')
        category_arr.map { |c| Category.find_or_initialize_by(name: c) }
      end
      self.categories = category_arr[0]
    end
  end

  class << self
    def upvoted_count(books)
      counts = []
      books.each do |book|
        counts << book.upvotes.count
      end
      counts
    end

    def borrowed_count(books)
      counts = []
      books.each do |book|
        counts << book.borrow_lists.count
      end
      counts
    end
  end
end
