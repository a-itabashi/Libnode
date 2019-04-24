class Admin::ApplicationController < ApplicationController
  private

  def admin?
    unless current_user.nil? || current_user.admin == true
      redirect_to root_path, danger: "管理者のみ実行可能なアクションです"
    end
  end
end
