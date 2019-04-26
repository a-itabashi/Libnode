class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_gon
  before_action :set_search

  add_flash_types :success, :info, :warning, :danger

  # CSRF対策
  protect_from_forgery

  private

  def set_gon
    gon.domain = ENV['DOMAIN']
  end

  def set_search
    @search = Book.ransack(params[:q])
    @search_books = @search.result
  end

  # ログイン後のリダイレクト先をオーバーライド
  def after_sign_in_path_for(_resource)
    root_path
  end

  # ログアウト後のリダイレクト先をオーバーライド
  def after_sign_out_path_for(_resource)
    new_admin_registration_path
  end
end
