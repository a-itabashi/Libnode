class PagesController < ApplicationController
  def book_collection_list
    @books = Book.all
    render "book_collection_list/book_collection_list"
  end
end
