class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[book_collection_list]

  def book_collection_list
    @books = Book.all
    render 'book_collection_list/book_collection_list'
  end
end
