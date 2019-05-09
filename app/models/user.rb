class User < ApplicationRecord
  has_many :upvotes, dependent: :destroy
  has_many :borrow_lists, dependent: :destroy

  validates :uid, :name, :email, :image, presence: true

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  scope :admin_users, -> { where(admin: true) }
  scope :recentry_upvoted_3, ->(book) { where(id: book.upvotes.order(created_at: :desc).limit(3).pluck(:user_id)) }

  def self.from_omniauth(token)
    user = User.where(name: token.info.name).find_by(uid: token.uid)
    if user.nil?
      user = User.create(uid: token.uid,
                         name: token.info.name,
                         email: token.info.email,
                         image: token.info.image)
    end
    return user
  end
end
