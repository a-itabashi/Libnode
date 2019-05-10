class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[become_admin_user become_normal_user destroy]

  def index
    @users = User.all
  end

  def become_admin_user
    redirect_to admin_users_path, success: "#{@user.name}さんを管理者ユーザーに変更しました" if @user.update(admin: true)
  end

  def become_normal_user
    redirect_to admin_users_path, success: "#{@user.name}さんを通常ユーザーに変更しました" if @user.update(admin: false)
  end

  def destroy
    redirect_to admin_users_path, success: "#{@user.name}さんを削除しました" if @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
