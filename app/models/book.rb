class Book < ApplicationRecord
  before_save :find_or_create_on_categories
  mount_uploader :image, BookImageUploader

  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories

  has_many :book_places, dependent: :destroy
  has_many :places, through: :book_places

  has_many :upvotes, dependent: :destroy
  has_many :borrow_lists, dependent: :destroy

  validates :title, :image, presence: true, presence: { message: 'は必ず入力してください' }
  validates :image, presence: true, presence: { message: 'は必ず入力してください' }, if: proc { |a| a.image_raw_url.blank? }
  validates :price, numericality: { greater_than_or_equal_to: 0 }, unless: proc { |a| a.price.blank? }

  scope :upvotes, ->(user) { where(id: user.upvotes.pluck(:book_id)) }
  scope :borrowed, ->(user) { where(id: user.borrow_lists.pluck(:book_id)) }
  scope :top_5_upvotes, -> { find(Upvote.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id)) }
  scope :top_5_borrowed, -> { find(BorrowList.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id)) }

  private

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
      books.map do |book|
        book.upvotes.count
      end
    end

    def borrowed_count(books)
      books.map do |book|
        book.borrow_lists.count
      end
    end

    def pickup_image(books)
      books.map do |book|
        book.image.present? ? book.image.url : book.image_raw_url.url
      end
    end

    def pickup_category_name(books)
      books.map do |book|
        book.categories.pluck(:name).flatten
      end
    end

    def saled_at_formetter(date)
      if %w[年 月 日].all? { |i| date.include?(i) }
        Time.strptime(date, '%Y年%m月%d日').strftime('%Y-%m-%d')
      elsif %w[年 月].all? { |i| date.include?(i) }
        Time.strptime(date, '%Y年%m月').strftime('%Y-%m')
      end
    end
  end
end
