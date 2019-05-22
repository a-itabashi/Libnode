module BorrowedChart
  extend ActiveSupport::Concern

  private

  def set_borrowed_chart
    books = Book.borrowed(@user)
    book_categories = Book.pickup_category_name(books)
    @borrowed_categories = book_categories.uniq
    @borrowed_datas = Category.how_many_contains(book_categories, @borrowed_categories)

    gon.borrowed_categories = @borrowed_categories
    gon.borrowed_datas = @borrowed_datas
    @borrowed_count = @user.borrow_lists.count
  end
end
