class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    set_upvote_chart
    set_borrowed_chart
  end

  def upvotes
    @user = User.find(params[:id])
    set_upvote_chart
  end

  def borrowed_books
    @user = User.find(params[:id])
    set_borrowed_chart
  end
end
