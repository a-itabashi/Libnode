class Admin::ApplicationController < ApplicationController
    # ログアウト後のリダイレクト先をオーバーライド
    def after_sign_out_path_for(resource)
      new_admin_registration_path
    end
end
