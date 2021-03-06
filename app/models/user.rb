class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    return user if user.present?
    registered_user = User.where(email: auth.info.email).first
    return registered_user if registered_user.present?
    User.create(name: auth.extra.raw_info.name, provider: auth.provider,
                uid: auth.uid, email: auth.info.email,
                password: Devise.friendly_token[0, 20])
  end
end
