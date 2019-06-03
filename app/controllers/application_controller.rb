class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_gon

  add_flash_types :success, :info, :warning, :danger

  # CSRF対策
  protect_from_forgery

  private

  def set_gon
    gon.domain = ENV['DOMAIN']
  end
end
