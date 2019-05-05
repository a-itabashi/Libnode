class RankingsController < ApplicationController
  def index
    gon.top_5_upvotes_count = Book.upvoted_count(Book.top_5_upvotes)
    gon.top_5_borrowed_count = Book.borrowed_count(Book.top_5_borrowed)
    @top_5_upvote_title = Book.top_5_upvotes.pluck(:title)
    @top_5_borrowed_title = Book.top_5_borrowed.pluck(:title)
  end
end
