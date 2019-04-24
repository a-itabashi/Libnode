class Admin::ApplicationController < ApplicationController
  # TODO: 将来的に以下の記述を削除
  skip_before_action :authenticate_user!

  private

  def admin?
    authenticate_user! # TODO: 将来的に削除
    unless current_user.nil? || current_user.admin == true
      redirect_to root_path, danger: "管理者のみ実行可能なアクションです"
    end
  end
end
