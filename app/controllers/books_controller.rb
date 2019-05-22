class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @search = Book.ransack(params[:q])
    @books = @search.result
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
