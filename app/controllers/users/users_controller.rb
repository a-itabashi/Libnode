class Users::UsersController < ApplicationController
  include BorrowedChart
  include UpvoteChart
  before_action :set_user
  before_action :set_borrowed_chart, only: %i[show borrowed_books]
  before_action :set_upvote_chart, only: %i[show upvotes]

  def show
    render 'users/show'
  end

  def upvotes
    render 'users/upvotes'
  end

  def borrowed_books
    render 'users/borrowed_books'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
