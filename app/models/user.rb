class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(token)
    user = User.where(name: token.info.name).find_by(uid: token.uid)
    if user.nil?
      user = User.create( uid: token.uid,
                          name: token.info.name,
                          email: token.info.email,
                          image: token.info.image,
                        )
    end
    return user
  end
end
