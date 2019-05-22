class Admin::ApplicationController < ApplicationController
  before_action :admin?

  private

  def admin?
    redirect_to root_path, danger: '管理者のみ実行可能なアクションです' unless current_user.nil? || current_user.admin == true
  end

  def application_owner?
    unless current_user.name == ENV['OWNER_NAME']
      flash[:danger] = '現在この機能は限られた管理者のみ実行可能にしています'
      redirect_back(fallback_location: root_path)
    end
  end
end
