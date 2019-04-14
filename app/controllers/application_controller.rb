class ApplicationController < ActionController::Base
  # CSRF対策
  protect_from_forgery

  # ログイン後のリダイレクト先をオーバーライド
  def after_sign_in_path_for(_resource)
    root_path
  end

  # ログアウト後のリダイレクト先をオーバーライド
  def after_sign_out_path_for(_resource)
    new_admin_registration_path
  end
end
