# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'
  config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {}
end
