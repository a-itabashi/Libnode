class Users::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    set_upvote_chart
    set_borrowed_chart
  end

  def edit
    set_upvote_chart
    set_borrowed_chart
  end

  def update
    redirect_to user_path(@user), success: 'ユーザー情報を更新しました' if @user.update!(user_params)
  end

  def upvotes
    @user = User.find(params[:id])
    set_upvote_chart
  end

  def borrowed_books
    @user = User.find(params[:id])
    set_borrowed_chart
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
