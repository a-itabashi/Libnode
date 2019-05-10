class Admin::ApplicationController < ApplicationController
  before_action :admin?
  private

  def admin?
    redirect_to root_path, danger: '管理者のみ実行可能なアクションです' unless current_user.nil? || current_user.admin == true
  end
end
