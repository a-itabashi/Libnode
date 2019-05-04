class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    set_upvote_chart(@user)
    set_borrowed_chart(@user)
  end
end
