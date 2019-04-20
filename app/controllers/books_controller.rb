class BooksController < ApplicationController
  def index
    @books = Book.all.borrow_lists.where(is_return: false)
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
