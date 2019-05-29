class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_gon

  add_flash_types :success, :info, :warning, :danger

  # CSRF対策
  protect_from_forgery

  private

  def set_gon
    # gon.domain = ENV['DOMAIN']
    gon.domain = '//libnode.com'
  end

  # ログイン後のリダイレクト先をオーバーライド
  def after_sign_in_path_for(_resource)
    root_path
  end

  # ログアウト後のリダイレクト先をオーバーライド
  def after_sign_out_path_for(_resource)
    root_path
  end
end
