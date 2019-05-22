module UpvoteChart
  extend ActiveSupport::Concern

  private

  def set_upvote_chart
    books = Book.upvotes(@user)
    book_categories = Book.pickup_category_name(books)
    @upvote_categories = book_categories.uniq
    @upvote_datas = Category.how_many_contains(book_categories, @upvote_categories)

    gon.upvote_categories = @upvote_categories
    gon.upvote_datas = @upvote_datas
    @upvote_count = @user.upvotes.count
  end
end
