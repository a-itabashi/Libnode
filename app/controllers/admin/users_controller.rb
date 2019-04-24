class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[update destroy]
  def index
    @users = User.all
  end

  def update
    redirect_to admin_users_path, success: "#{@user.name}さんを管理者ユーザーに変更しました" if @user.update(admin: true)
  end

  def destroy
    redirect_to admin_users_path, success: "#{@user.name}さんを削除しました" if @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
