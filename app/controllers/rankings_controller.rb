class RankingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    gon.top_5_upvotes_count = Book.upvoted_count(Book.top_5_upvotes)
    gon.top_5_borrowed_count = Book.borrowed_count(Book.top_5_borrowed)
    @top_5_upvote_images = Book.pickup_image(Book.top_5_upvotes)
    @top_5_borrowed_images = Book.pickup_image(Book.top_5_borrowed)
  end
end
