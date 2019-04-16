class PagesController < ApplicationController
  def book_collection_list
    @books = Book.all
  end
end
