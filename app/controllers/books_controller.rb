class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    render json:[@book.image, @book.title, @book.author]
    # render json: @book, adapter: :json
  end
end
