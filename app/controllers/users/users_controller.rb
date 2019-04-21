class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render 'users/show', locals: { user: @user }
  end
end
